import 'package:tut_app/core/api_endpoints.dart';

class LoginModel {
  final String message;
  final String token;

  LoginModel({
    required this.message,
    required this.token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json[ApiKeys.message],
      token: json[ApiKeys.token],
    );
  }
}
