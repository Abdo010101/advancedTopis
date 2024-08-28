import 'package:development/features/home/data/api/home_api_serviec.dart';
import 'package:development/features/home/data/repos/home_repo.dart';
import 'package:development/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getAllSpecialestDoctors() async {
    emit(const HomeState.getAllDoctorSpecilestLoading());

    final response = await _homeRepo.getAllDoctorsSpecialiests();
    response.when(success: (loginRespone) {
      emit(HomeState.getAllDoctorSpecilestSuccess(loginRespone));
    }, failure: (error) {
      emit(HomeState.getAllDoctorSpecilestError(
          error: error.apiErrorModel.message ?? "Erro happen"));
    });
  }
}
