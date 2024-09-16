import 'package:dio/dio.dart';
import 'package:doctor/core/network/api_constants.dart';
import 'package:doctor/features/home/data/model/home_response_model.dart';
import 'package:doctor/features/login/data/models/login_request_body.dart';
import 'package:doctor/features/login/data/models/login_response_body.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl) 
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  //signup
  @POST(ApiConstants.register)
  Future<SignupResponseBody> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  //home
  @GET(ApiConstants.specializationEP)
  Future<SpecializationsResponseModel> home();
}