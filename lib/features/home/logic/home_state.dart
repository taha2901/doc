part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  
  const factory HomeState.specializationsLoading() =  SpecializationsLoading;
  const factory HomeState.specializationsSuccess({required SpecializationsResponseModel specializationResponseModel}) = SpecializationsSuccess;
  const factory HomeState.specializationsError({required ErrorHandler errorHandler}) = SpecializationsError;


}
