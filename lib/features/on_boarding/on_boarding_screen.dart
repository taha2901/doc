
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/styles.dart';
import 'widgets/doc_logo_and_name.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                const DoctorImageAndText(),
                Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily\nwith Docdoc to get a new experience.',
                      style: TextStyles.font13GreyRegular,
                      textAlign:  TextAlign.center,
                    ),
                    Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: const GetStartedButton(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
