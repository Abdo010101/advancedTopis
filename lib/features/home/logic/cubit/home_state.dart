import 'package:development/core/netwoking/api_error_handler.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/doctor.dart';
import 'package:development/features/home/data/models/specialest_doctor_model/specialest_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // specialization
  const factory HomeState.getAllDoctorSpecilestLoading() =
      GetAllDoctorSpecilestLoading;

  const factory HomeState.getAllDoctorSpecilestSuccess(
      SpecialestResponse specialestResponse) = GetAllDoctorSpecilestSuccess;

  const factory HomeState.getAllDoctorSpecilestError({required String error}) =
      GetAllDoctorSpecilestError;

  // doctor filter
  const factory HomeState.doctorSucess({required List<Doctor?>? doctors}) =
      DoctorSuccess;
  const factory HomeState.doctorError(ErrorHandler errorHandler) = DoctorError;
}
