import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/features/home/ui/widget/doctors_blue_container.dart';
import 'package:doctor/features/home/ui/widget/doctors_speciality_see_all.dart';
import 'package:flutter/material.dart';
import 'widget/home_top_bar.dart';
import 'widget/specialization_and_doctor_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              const SpecializationAndDoctorBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
