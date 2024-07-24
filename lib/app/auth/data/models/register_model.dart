class RegisterModel {
  final String message;

  RegisterModel({required this.message});
  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json['message'],
      );
}
