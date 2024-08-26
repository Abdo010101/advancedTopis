import 'package:development/core/helpers/spacing.dart';
import 'package:development/features/home/ui/widgets/custom_text_specialist.dart';
import 'package:development/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor_specialist.dart';
import 'package:development/features/home/ui/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  ///* NOTE NOTE NOTE NOTE NOTE NOTE NOTE */
  //! Note the column take full width but not full width
  //! so we need wrap the column with container
  ////!and give the conatiner full width to make column take full width

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopAppBar(),
              const DoctorBlueContainer(),
              verticalSpace(10),
              const CustomTextSpecialist(),
              verticalSpace(5),
              const ListViewDoctorSpecialist(),
              verticalSpace(7),
              const ListViewDoctor(),
            ],
          ),
        ),
      ),
    );
  }
}
