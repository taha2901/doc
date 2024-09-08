import 'package:doctor/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routings/routers.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // maximumSize: WidgetStateProperty.all(
              //   const Size(double.infinity, 52),
              // ),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ))),
          onPressed: () {
            context.pushNamed(Routers.login);
          },
          child: Text(
            'Get Started',
            style: TextStyles.font16WhiteMedium,
          )),
    );
  }
}
