import 'package:tut_app/constants/api_endpoints.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/services/networking/api_consumer.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';

class ProfileRepository {
  final ApiConsumer api;

  ProfileRepository({required this.api});

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
    return UserModel.fromJson(response);
  }
}
