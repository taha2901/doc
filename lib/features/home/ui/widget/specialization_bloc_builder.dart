import 'package:doctor/features/home/ui/widget/doctors_shimmer_loading.dart';
import 'package:doctor/features/home/ui/widget/speciality_list_view.dart';
import 'package:doctor/features/home/ui/widget/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({
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
            return setUpLoading();
          },
          specializationsSuccess: (specializationResponseModel) {
            return setUpSuccess(specializationResponseModel);
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

  

  Widget setUpLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setUpError() => const SizedBox.shrink();

  Widget setUpSuccess(specializationList) {
    return Skeletonizer(
      enabled: false,
      child: SpecialityListView(
        specializationDataList: specializationList,
      ),
    );
  }
}
