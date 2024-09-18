// ignore: unused_import
import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../logic/home_cubit.dart';
import 'doctors_list_view.dart';

class DoctorBlocBuilder extends StatelessWidget {
  const DoctorBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess ||
          current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setUpSuccess(doctorsList);
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

  Widget setUpSuccess(doctorList) {
    return Skeletonizer(
      enabled: false,
      child: DoctorsListView(
        doctorList: doctorList,
      ),
    );
  }

}
