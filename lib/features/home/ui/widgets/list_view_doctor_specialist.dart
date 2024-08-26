import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewDoctorSpecialist extends StatelessWidget {
  const ListViewDoctorSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 10.w),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/list_image.svg',
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    'Omar',
                    style: TextStyles.font12DarkBlueRegular,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
