import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor_specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewDoctorSpecialist extends StatelessWidget {
  final List<SpecialestDoctorModel?>? myList;
  const ListViewDoctorSpecialist({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          itemCount: myList?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ListViewDoctorSpecialistItem(
              index: index,
              specialestDoctorModel: myList?[index],
            );
          }),
    );
  }
}
