import 'package:bloc/bloc.dart';
import 'package:doctor/core/network/api_error_handler.dart';
import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/home/data/repo/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final response = await _homeRepo.home();
    response.when(success: (specializationsResponseModel) {
      emit(HomeState.specializationsSuccess(
          specializationResponseModel: specializationsResponseModel));
    }, failure: (errorHandler) {
      emit(HomeState.specializationsError(errorHandler: errorHandler));
    });
  }
}
