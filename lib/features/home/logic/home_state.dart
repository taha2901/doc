part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  
  const factory HomeState.specializationsLoading() =  SpecializationsLoading;
  const factory HomeState.specializationsSuccess({required List<SpecializationsData>? specializationDataList}) = SpecializationsSuccess;
  const factory HomeState.specializationsError({required ErrorHandler errorHandler}) = SpecializationsError;

  //doctors
  const factory HomeState.doctorsSuccess({required List<Doctors?>? doctorList}) = DoctorsSuccess;
  const factory HomeState.doctorsError({required ErrorHandler errorHandler}) = DoctorsError;

}
