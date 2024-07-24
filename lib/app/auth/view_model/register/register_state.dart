part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class UploadImageSuccess extends RegisterState {
  final XFile image;

  UploadImageSuccess({
    required this.image,
  });
}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String errMsg;

  RegisterFailure({required this.errMsg});
}
