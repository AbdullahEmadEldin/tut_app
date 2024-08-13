import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_app/modules/auth/data/repository/auth_repository.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthService auth;
  LogoutCubit({required this.auth}) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await auth.logout();
      emit(LogoutSuccess());
    } catch (e) {
      print('---------->LOGOUT CUBIT ERROR: ${e.toString()}');
      emit(LogoutFailure(message: e.toString()));
    }
  }
}
