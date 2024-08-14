import 'package:image_picker/image_picker.dart';
import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/network_helper.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model_form.dart';

class ProfileRepository {
  final ApiConsumer api;

  ProfileRepository._({
    required this.api,
  });

  factory ProfileRepository() => ProfileRepository._(api: DioConsumer());

  Future<bool> logout() async {
    return true;
  }

  /// requires user id and get it from cache storage.
  Future<UserModel> getUserData() async {
    final response = await api.get(
      path: ApiEndpoints.getUserDataById(
        CacheHelper.getData(key: AppConstants.sharedPrefKeys.userId),
      ),
    );
    return UserModel.fromJson(response['user']);
  }

  Future<dynamic> patchUserData({
    required UserModelForm userForm,
    bool picUpload = false,
    XFile? pic,
  }) async {
    final response = await api.patch(
      path: ApiEndpoints.updateData,
      body: picUpload
          ? {
              "name": userForm.name,
              "phone": userForm.phone,
              'location':
                  '{"name":"Egypt","address":"meet","coordinates":[1214451511,12541845]}',
              "profilePic": await NetworkHelper.uploadImageToApi(pic),
            }
          : userForm.toMap(),
      isFormData: true,
    );
    return response;
  }
}
