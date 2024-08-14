import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model_form.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/repository/profile_repository.dart';

part 'edit_user_data_state.dart';

class EditUserDataCubit extends Cubit<EditUserDataState> {
  final ProfileRepository profileRepository;
  EditUserDataCubit({
    required this.profileRepository,
  }) : super(EditUserDataInitial());

//! Edit name
  Future<void> editName(
      {required UserModel user, required String newName}) async {
    emit(EditNameLoading());

    /// this process is performed as the backend doesn't allow to change the email.
    ///
    final UserModel updatedUser = user.copyWith(name: newName);
    final UserModelForm userForm = UserModelForm.fromMap(updatedUser.toMap());

    try {
      final response = await profileRepository.patchUserData(
        userForm: userForm,
      );
      emit(EditNameSuccess(successMessage: response.toString()));

      /// update the user is the state to avoid call the api
      emit(UserUpdatedState(updatedUser: updatedUser));
    } on Exception catch (e) {
      emit(EditNameFailure(errorMessage: e.toString()));
    }
  }

//! Edit Phone number
  Future<void> editPhone(
      {required UserModel user, required String newPhone}) async {
    emit(EditPhoneNumberLoading());

    /// this process is performed as the backend doesn't allow to change the email.
    ///
    final UserModel updatedUser = user.copyWith(phone: newPhone);
    final UserModelForm userForm = UserModelForm.fromMap(updatedUser.toMap());

    try {
      final response = await profileRepository.patchUserData(
        userForm: userForm,
      );
      emit(EditPhoneNumberSuccess(successMessage: response.toString()));

      /// update the user is the state to avoid call the api
      emit(UserUpdatedState(updatedUser: updatedUser));

      user.copyWith(phone: newPhone);
    } on Exception catch (e) {
      emit(EditPhoneNumberFailure(errorMessage: e.toString()));
    }
  }

//! Edit Profile pic

  XFile? profilePic;

  /// This method to get XFile from UI.
  Future<void> updateImage({required XFile image}) async {
    profilePic = image;
  }

  Future<void> uploadPic({
    required UserModel user,
  }) async {
    emit(EditPictureLoading());

    /// this process is performed as the backend doesn't allow to change the email.
    /// (This means that the model coming from the backend is not the same as that going to the backend).
    final UserModel updatedUser = user.copyWith();

    final UserModelForm userForm = UserModelForm.fromMap(
        user.copyWith(profilePic: profilePic!.path).toMap());

    try {
      final response = await profileRepository.patchUserData(
        userForm: userForm,
        picUpload: true,
        pic: profilePic,
      );
      emit(EditPictureSuccess(successMessage: response.toString()));

      /// update the user is the state to avoid call the api
      emit(UserUpdatedState(updatedUser: updatedUser));
    } on Exception catch (e) {
      emit(EditPictureFailure(errorMessage: e.toString()));
    }
  }
}
