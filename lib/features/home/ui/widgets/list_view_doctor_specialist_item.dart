import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListViewDoctorSpecialistItem extends StatelessWidget {
  const ListViewDoctorSpecialistItem(
      {super.key, required this.index, required this.specialestDoctorModel});
  final int index;
  final SpecialestDoctorModel? specialestDoctorModel;

  @override
  Widget build(BuildContext context) {
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
            specialestDoctorModel?.name ?? 'DoctorName',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
