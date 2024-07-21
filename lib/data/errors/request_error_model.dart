class ServerErrorModel {
  final int statusCode;
  final String errorMessage;

  ServerErrorModel({
    required this.statusCode,
    required this.errorMessage,
  });
  factory ServerErrorModel.fromJson(Map<String, dynamic> json) {
    return ServerErrorModel(
      statusCode: json['status'],
      errorMessage: json['ErrorMessage'],
    );
  }
}
