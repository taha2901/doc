import 'package:bloc/bloc.dart';
import 'package:doctor/core/helpers/extentions.dart';
import 'package:doctor/core/network/api_error_handler.dart';
import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/home/data/repo/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final response = await _homeRepo.home();
    response.when(
      success: (specializationsResponseModel) {
        specializationList =
          specializationsResponseModel.specializationDataList ?? [];
        getDoctors(specializationId: specializationList?.first?.id);
        emit(
          HomeState.specializationsSuccess(
            specializationDataList:
                specializationsResponseModel.specializationDataList,
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          HomeState.specializationsError(
            errorHandler: errorHandler,
          ),
        );
      },
    );
  }

  void getDoctors({required int? specializationId}) async {
    List<Doctors?>? doctorList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorList: doctorList));
    } else {
      emit(HomeState.doctorsError(
          errorHandler: ErrorHandler.handle("No Data Found")));
    }
  }

  /// returns list of doctors basesd on specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationList
        ?.firstWhere((element) => element?.id == specializationId)
        ?.doctorsList;
  }
}
