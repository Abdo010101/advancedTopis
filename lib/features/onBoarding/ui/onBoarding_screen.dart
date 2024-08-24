import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/onBoarding/ui/widgets/doctor_image_widget.dart';
import 'package:development/features/onBoarding/ui/widgets/doctor_logo_widget.dart';
import 'package:development/features/onBoarding/ui/widgets/getStartedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              DoctorLogoWidget(),
              verticalSpace(30.h),
              DotorImageWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                ),
              ),
              verticalSpace(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: GetStartedButton(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
