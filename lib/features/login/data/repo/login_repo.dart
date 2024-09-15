import 'package:doctor/core/network/api_services.dart';
import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/data/models/login_response_body.dart';
import 'package:doctor/core/network/api_result.dart';
import 'package:doctor/core/network/api_error_handler.dart';
class LoginRepo {
  final ApiServices _apiServices;
  LoginRepo(this._apiServices);
  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
         ErrorHandler.handle(error),
      );
    }
  }
}