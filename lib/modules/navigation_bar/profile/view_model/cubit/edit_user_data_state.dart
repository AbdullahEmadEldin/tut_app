part of 'edit_user_data_cubit.dart';

@immutable
sealed class EditUserDataState {}

final class EditUserDataInitial extends EditUserDataState {}

//! Edit Name states
final class EditNameLoading extends EditUserDataState {}

final class EditNameSuccess extends EditUserDataState {
  final String successMessage;

  EditNameSuccess({required this.successMessage});
}

final class EditNameFailure extends EditUserDataState {
  final String errorMessage;

  EditNameFailure({required this.errorMessage});
}

//! Edit Phone Number states
final class EditPhoneNumberLoading extends EditUserDataState {}

final class EditPhoneNumberSuccess extends EditUserDataState {
  final String successMessage;

  EditPhoneNumberSuccess({required this.successMessage});
}

final class EditPhoneNumberFailure extends EditUserDataState {
  final String errorMessage;

  EditPhoneNumberFailure({required this.errorMessage});
}

//! Edit Picture states
final class EditPictureLoading extends EditUserDataState {}

final class EditPictureSuccess extends EditUserDataState {
  final String successMessage;

  EditPictureSuccess({required this.successMessage});
}

final class EditPictureFailure extends EditUserDataState {
  final String errorMessage;

  EditPictureFailure({required this.errorMessage});
}
//! ======================== IMP =========================!\\
//! =========== updating user model in the state =========!\\
//! =======================================================!\\

/// The problem is when I update both of name and phone in the same session(application state)
///the following happens as ex:
///   ==> update phone num to api success and the other same data is sent with it without editing
///   ==> then if I update the name directly after that it updates successfully,
/// the old user's data with the old phone number which I get them from the state
/// are sent with it(name) to api so it override the updated phone number and reverse
/// it's change back. is there is a solution to refresh the state directly
/// after updating one item without making an api(to get the updated data back) call or any other solution?
//? When this state is triggered we will update GetUserDataSuccess state without need to make extra api call
final class UserUpdatedState extends EditUserDataState {
  final UserModel updatedUser;

  UserUpdatedState({required this.updatedUser});
}
