/// This will be the interface for api service
abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    void Function(int, String)? cancelToken,
    bool isFormData = false,
  });

  Future<dynamic> delete({
    required String path,
    bool isFormData = false,
  });

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? body,
    bool isFormData = false,
  });
}
