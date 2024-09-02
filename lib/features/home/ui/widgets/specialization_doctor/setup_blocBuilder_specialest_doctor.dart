import 'package:development/core/helpers/spacing.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/logic/cubit/home_cubit.dart';
import 'package:development/features/home/logic/cubit/home_state.dart';
import 'package:development/features/home/ui/widgets/doctor_list/doctors_shimmer_loading.dart';
import 'package:development/features/home/ui/widgets/specialization_doctor/list_view_specialist.dart';
import 'package:development/features/home/ui/widgets/specialization_doctor/specialzation_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupBlocbuilderSpecialest extends StatelessWidget {
  const SetupBlocbuilderSpecialest({super.key});

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

          return SetupSucess(secialestList: secialestList);
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
  SetupSucess({
    super.key,
    required this.secialestList,
  });

  final List<SpecialestDoctorModel?>? secialestList;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListViewSpecialist(
      myList: secialestList ?? [],
    );
  }
}

class SetupError extends StatelessWidget {
  const SetupError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        const SpecialityShimmerLoading(),
        verticalSpace(14),
        const DoctorsShimmerLoading(),
      ]),
    );
  }
}
