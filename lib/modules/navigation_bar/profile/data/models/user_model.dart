import 'package:tut_app/constants/api_endpoints.dart';

class UserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;

  UserModel({
    required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      profilePic: jsonData['user'][ApiKeys.profilePic],
      email: jsonData['user'][ApiKeys.email],
      phone: jsonData['user'][ApiKeys.phoneNum],
      name: jsonData['user'][ApiKeys.userName],
    );
  }
}
