import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewDoctorItem extends StatelessWidget {
  const ListViewDoctorItem({super.key, required this.doctorItem});
  final Doctor? doctorItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 10.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              'assets/images/dummy.png',
              fit: BoxFit.cover,
              width: 120.w,
              height: 120.h,
            ),
          ),
          horizontalSpace(8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorItem?.name ?? 'DR Handy Andelsies',
                style: TextStyles.font18DarkBlueBold,
              ),
              verticalSpace(10),
              Text('${doctorItem?.degree}  |${doctorItem?.phone} '),
              verticalSpace(10),
              Text(doctorItem?.email ?? 'fake email '),
            ],
          ))
        ],
      ),
    );
  }
}
