import 'package:doctor/core/network/api_error_handler.dart';
import 'package:doctor/core/network/api_result.dart';
import 'package:doctor/core/network/api_services.dart';
import 'package:doctor/features/home/data/model/home_response_model.dart';

class HomeRepo {
  final ApiServices _apiServices;
  HomeRepo(this._apiServices);
  Future<ApiResult<SpecializationsResponseModel>> home() async {
    try {
      final response = await _apiServices.home();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
         ErrorHandler.handle(error),
      );
    }
  }
}