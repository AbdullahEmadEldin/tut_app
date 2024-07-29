part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMsg;
  final String? emailError;
  final String? passwordError;
  LoginFailure({
    required this.errMsg,
    this.emailError,
    this.passwordError,
  });
}
