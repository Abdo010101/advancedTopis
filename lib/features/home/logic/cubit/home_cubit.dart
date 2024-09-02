import 'package:development/core/helpers/extention.dart';
import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/features/home/data/api/home_api_serviec.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_doctor_model.dart';
import 'package:development/features/home/data/repos/home_repo.dart';
import 'package:development/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  /// this list have all specialzatoins  with all doctor in the each specialzation field
  List<SpecialestDoctorModel?>? sepcialestDoctorList = [];


  void getAllSpecialestDoctors() async {
    emit(const HomeState.getAllDoctorSpecilestLoading());

    final response = await _homeRepo.getAllDoctorsSpecialiests();
    response.when(success: (sepcialztionResponse) {
      sepcialestDoctorList = sepcialztionResponse.data ?? [];

      /// get Doctor List with firt id in the list
      getDoctorList(sepcialestDoctorList?.first?.id?.toInt());

      emit(HomeState.getAllDoctorSpecilestSuccess(sepcialztionResponse));
    }, failure: (error) {
      emit(HomeState.getAllDoctorSpecilestError(
          error: error.apiErrorModel.message ?? "Erro happen"));
    });
  }

  void getDoctorList(int? specializationDoctorId) {
    List<Doctor?>? doctorList = getDoctorsBySpecializationId(
        specializationDoctorId: specializationDoctorId);
    if (!doctorList.isNullOrEmpty()) {
      // there is data inside it
      emit(HomeState.doctorSucess(doctors: doctorList));
    } else {
      emit(HomeState.doctorError(ErrorHandler.handle('No Doctor Found')));
    }
  }

  /// get doctor List based on givne Id
  List<Doctor?>? getDoctorsBySpecializationId(
      {required int? specializationDoctorId}) {
    return sepcialestDoctorList
            ?.firstWhere((item) => item?.id == specializationDoctorId)
            ?.doctors ??
        [];
  }



}
