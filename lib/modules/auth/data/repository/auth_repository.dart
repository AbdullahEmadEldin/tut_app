import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/network_helper.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/modules/auth/data/models/login_model.dart';
import 'package:tut_app/modules/auth/data/models/register_model.dart';
import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';

class AuthService {
  final ApiConsumer api;
  AuthService._({
    required this.api,
  });

  factory AuthService() => AuthService._(api: DioConsumer(dio: Dio()));

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

  Future<RegisterModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required XFile? profilePic,
  }) async {
    final response = await api.post(
      path: ApiEndpoints.signUp,
      isFormData: true,
      body: {
        ApiKeys.userName: name,
        ApiKeys.email: email,
        ApiKeys.phoneNum: phone,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.profilePic: await NetworkHelper.uploadImageToApi(profilePic),
        'location': //This is my location. Not needed in this project but the ready made API require it
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}'
      },
    );
    return RegisterModel.fromJson(response);
  }

  /// logout endPoint need the token in header and it will be passed from the INTERCEPTOR.
  Future<void> logout() async {
    try {
      api.get(path: ApiEndpoints.logOut);
      CacheHelper.saveData(
          key: AppConstants.sharedPrefKeys.stayLoggedIn, value: false);
    } on Exception catch (e) {
      print('====> Unhandled error: ${e.toString()}');
    }
  }
}
