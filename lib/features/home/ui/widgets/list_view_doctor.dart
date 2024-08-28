import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/style.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor_item.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewDoctor extends StatelessWidget {
  final List<Doctor?>? myList;
  const ListViewDoctor({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: myList?.length,
            itemBuilder: (context, index) {
              return ListViewDoctorItem(
                doctorItem: myList?[index],
              );
            }));
  }
}
