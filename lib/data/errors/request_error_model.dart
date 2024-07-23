/// handling error details like this as a reaction against the server error response
/// and handling it properly
class ServerErrorModel {
  final int statusCode;
  final String errorMessage;
  final List<dynamic>? errorDetails;
  ServerErrorModel({
    required this.statusCode,
    required this.errorMessage,
    this.errorDetails,
  });

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) {
    return ServerErrorModel(
      statusCode: json['status'],
      errorMessage: json['ErrorMessage'],
      errorDetails:
          json['ErrorMessage'] == 'validationError' ? json['Error'] : null,
    );
  }
}
