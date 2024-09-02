import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/home/ui/widgets/specialization_doctor/list_view_specialist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewSpecialist extends StatefulWidget {
  final List<SpecialestDoctorModel?>? myList;

  const ListViewSpecialist({super.key, required this.myList});

  @override
  State<ListViewSpecialist> createState() => _ListViewSpecialistState();
}

class _ListViewSpecialistState extends State<ListViewSpecialist> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          itemCount: widget.myList?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                context.read<HomeCubit>().getDoctorList(
                    widget.myList?[selectedIndex]?.id?.toInt() ?? 2);
              },
              child: ListViewSpecialistItem(
                selectedIndex: selectedIndex,
                index: index,
                specialestDoctorModel: widget.myList?[index],
              ),
            );
          }),
    );
  }
}
