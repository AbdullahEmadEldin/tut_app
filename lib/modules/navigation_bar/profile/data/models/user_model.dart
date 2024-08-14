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
      profilePic: jsonData[ApiKeys.profilePic],
      email: jsonData[ApiKeys.email],
      phone: jsonData[ApiKeys.phoneNum],
      name: jsonData[ApiKeys.userName],
    );
  }

  UserModel copyWith({
    String? profilePic,
    String? email,
    String? phone,
    String? name,
  }) {
    return UserModel(
      profilePic: profilePic ?? this.profilePic,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profilePic': profilePic,
      'email': email,
      'phone': phone,
      'name': name,
      'location':
          '{"name":"Egypt","address":"meet halfa","coordinates":[1214451511,12541845]}' // req by backend, we don't need it
    };
  }
}
