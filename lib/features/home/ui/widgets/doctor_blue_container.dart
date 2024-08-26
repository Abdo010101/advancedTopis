import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 170.h,
              width: double.infinity,
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/doctorImg.png')),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book and\nschedule with\nnearest doctor',
                      style: TextStyles.font16WhiteMedium,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(16),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Text(
                          'Nearby',
                          style: TextStyles.font13BlueRegular,
                        ))
                  ],
                ),
              ),
            ),
          ),
          PositionedDirectional(
              end: 15,
              top: 0,
              child: Image.asset(
                'assets/images/nurseImg.png',
                height: 200.h,
              )),
        ],
      ),
    );
  }
}
