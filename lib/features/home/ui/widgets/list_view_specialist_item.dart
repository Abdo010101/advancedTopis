import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListViewSpecialistItem extends StatelessWidget {
  const ListViewSpecialistItem(
      {super.key,
      required this.index,
      required this.specialestDoctorModel,
      required this.selectedIndex});
  final int index;
  final SpecialestDoctorModel? specialestDoctorModel;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 10.w),
      child: Column(
        children: [
          selectedIndex == index
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 30.w,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/list_image.svg',
                      height: 35.h,
                      width: 35.w,
                    ),
                  ),
                )
              : CircleAvatar(
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
            style: selectedIndex == index
                ? TextStyles.font12DarkBlueMeduim
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
