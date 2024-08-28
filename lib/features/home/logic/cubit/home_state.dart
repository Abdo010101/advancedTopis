import 'package:development/features/home/data/models/specialest_doctor_model/specialest_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.getAllDoctorSpecilestLoading() =
      GetAllDoctorSpecilestLoading;

  const factory HomeState.getAllDoctorSpecilestSuccess(
      SpecialestResponse specialestResponse) = GetAllDoctorSpecilestSuccess;

  const factory HomeState.getAllDoctorSpecilestError({required String error}) =
      GetAllDoctorSpecilestError;
}
