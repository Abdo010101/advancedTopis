import 'package:development/core/helpers/spacing.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/home/logic/cubit/home_state.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor.dart';
import 'package:development/features/home/ui/widgets/list_view_doctor_specialist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupBlocbuilderSpecialestDoctor extends StatelessWidget {
  const SetupBlocbuilderSpecialestDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetAllDoctorSpecilestLoading ||
          current is GetAllDoctorSpecilestSuccess ||
          current is GetAllDoctorSpecilestError,
      builder: (context, state) {
        return state.maybeWhen(getAllDoctorSpecilestLoading: () {
          return const SetupError();
        }, getAllDoctorSpecilestSuccess: (specialestRespones) {
          var secialestList = specialestRespones.data;
          var doctorLists = specialestRespones.data?[0]?.doctors;

          return SetupSucess(
              secialestList: secialestList, doctorLists: doctorLists);
        }, getAllDoctorSpecilestError: (errorHandler) {
          return const SizedBox.shrink();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }
}

class SetupSucess extends StatelessWidget {
  const SetupSucess({
    super.key,
    required this.secialestList,
    required this.doctorLists,
  });

  final List<SpecialestDoctorModel?>? secialestList;
  final List<Doctor>? doctorLists;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListViewDoctorSpecialist(
            myList: secialestList ?? [],
          ),
          verticalSpace(7),
          ListViewDoctor(
            myList: doctorLists ?? [],
          ),
        ],
      ),
    );
  }
}

class SetupError extends StatelessWidget {
  const SetupError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: CircularProgressIndicator()));
  }
}
