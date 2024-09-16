import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/home/ui/widget/doctor_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';
import 'doctors_list_view.dart';

class SpecializationAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setUpLoaded();
          },
          specializationsSuccess: (specializationResponseModel) {
            var specializationList =
                specializationResponseModel.specializationDataList;

            return setUpSuccess(specializationList);
          },
          specializationsError: (errorHandler) {
            return setUpError();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setUpError() => const SizedBox.shrink();

  Widget setUpSuccess(List<SpecializationsData>? specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(
            specializationDataList: specializationList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(
            doctorList: specializationList?[0].doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  Widget setUpLoaded() => const Center(child: CircularProgressIndicator());
}
