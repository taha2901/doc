import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';
@JsonSerializable()
class SignupResponseBody {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code ;

  SignupResponseBody({ this.message,  this.userData , this.status , this.code  });

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);
}


@JsonSerializable()

class UserData {
   String? token;
   String? username;

  UserData({ this.token,  this.username});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

}
