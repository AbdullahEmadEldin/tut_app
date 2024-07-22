import 'package:tut_app/app/auth/data/models/login_model.dart';
import 'package:tut_app/core/api_endpoints.dart';
import 'package:tut_app/data/networking/api_consumer.dart';

class AuthService {
  final ApiConsumer api;
  AuthService({
    required this.api,
  });

  Future<LoginModel> login(String email, String password) async {
    final response = await api.post(
      path: ApiEndpoints.signIn,
      body: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      },
    );
    return LoginModel.fromJson(response);
  }
}
