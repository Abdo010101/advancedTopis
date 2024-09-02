import 'package:development/core/helpers/spacing.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/home/logic/cubit/home_state.dart';
import 'package:development/features/home/ui/widgets/doctor_list/list_view_doctor.dart';
import 'package:development/features/home/ui/widgets/specialization_doctor/setup_blocBuilder_specialest_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupBlocbuilderDoctorList extends StatelessWidget {
  const SetupBlocbuilderDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorSuccess || current is DoctorError,
      builder: (context, state) {
        return state.maybeWhen(doctorSucess: (doctorList) {
          return SetupSuccessDoctor(
            listOfDoctors: doctorList,
          );
        }, doctorError: (errorHander) {
          return const SetupErrorDoctor();
        }, orElse: () {
          return const SetupErrorDoctor();
        });
      },
    );
  }
}

class SetupErrorDoctor extends StatelessWidget {
  const SetupErrorDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

class SetupSuccessDoctor extends StatelessWidget {
  const SetupSuccessDoctor({super.key, required this.listOfDoctors});
  final List<Doctor?>? listOfDoctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          verticalSpace(7),
          ListViewDoctor(
            myList: listOfDoctors ?? [],
          ),
        ],
      ),
    );
    ;
  }
}
