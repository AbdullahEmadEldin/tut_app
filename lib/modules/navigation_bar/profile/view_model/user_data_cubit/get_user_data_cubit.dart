import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/core/services/errors/exceptions.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/repository/profile_repository.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  final ProfileRepository profileRepository;
  GetUserDataCubit({required this.profileRepository})
      : super(GetUserDataInitial());

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final userData = await profileRepository.getUserData();
      emit(GetUserDataSuccess(userData: userData));
    } on ServerException catch (e) {
      emit(GetUserDataFailure(errorMessage: e.error.errorMessage));
    }
  }

  /// This is to just update the state
  Future<void> updateUser({required UserModel updatedUser}) async {
    print('====>> This is test in GetUserData Cubit');
    emit(GetUserDataSuccess(userData: updatedUser));
  }
}
