import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:rive/rive.dart';
import 'package:tut_app/app/auth/data/login_animations_enum.dart';
import 'package:tut_app/app/auth/data/repository/auth_repository.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/data/errors/exceptions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit({required this.authService}) : super(LoginInitial());

  ///
  /// define key for text validation
  ///
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// artboard of rive file
  Artboard? riveArtBoard;

  /// initializing controllers of animations
  RiveAnimationController idleStaticController =
      SimpleAnimation(LoginAnimations.idleStatic.text);
  RiveAnimationController idleAnimatedController =
      SimpleAnimation(LoginAnimations.idleAnimated.text);
  RiveAnimationController listeningController =
      SimpleAnimation(LoginAnimations.listening.text);
  RiveAnimationController voiceEndController =
      SimpleAnimation(LoginAnimations.voiceEnd.text);
  RiveAnimationController voiceStartController =
      SimpleAnimation(LoginAnimations.voiceStart.text);
  RiveAnimationController voiceLoopController =
      SimpleAnimation(LoginAnimations.voiceLoop.text);
  RiveAnimationController maximizedController =
      SimpleAnimation(LoginAnimations.maximize.text);
  RiveAnimationController minimizeController =
      SimpleAnimation(LoginAnimations.minimize.text);
  RiveAnimationController wrongPasswordController =
      SimpleAnimation(LoginAnimations.wrongPassword.text);
  RiveAnimationController loadingStartController =
      SimpleAnimation(LoginAnimations.loadingStart.text);
  RiveAnimationController loadingLoopController =
      SimpleAnimation(LoginAnimations.loadingLoop.text);
  RiveAnimationController loadingEndController =
      SimpleAnimation(LoginAnimations.loadingEnd.text);

  Future<void> initializeRiveAnimation() async {
    /// rootBundle Contains all assets embedded in the project
    rootBundle.load(AnimationAssets.loginAnimation).then((data) async {
      await RiveFile.initialize();

      /// hold the complete rive file
      final file = RiveFile.import(data);

      /// access the animation inside the rive file
      final artBoard = file.mainArtboard;
      artBoard.addController(idleAnimatedController);

      riveArtBoard = artBoard;
    });
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        _login();
      } else {
        addActiveController(wrongPasswordController);
      }
    });
  }

  /// without this method ,the animation will not be triggered after the password focus node is unfocused
  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addActiveController(minimizeController);
      } else if (!passwordFocusNode.hasFocus) {
        addActiveController(maximizedController);
      }
    });
  }

  /// This method to change animation
  addActiveController(RiveAnimationController<dynamic> activeController) {
    _removeAllControllers();
    riveArtBoard?.artboard.addController(activeController);
  }

  _removeAllControllers() {
    riveArtBoard?.artboard.removeController(idleStaticController);
    riveArtBoard?.artboard.removeController(idleAnimatedController);
    riveArtBoard?.artboard.removeController(listeningController);
    riveArtBoard?.artboard.removeController(voiceEndController);
    riveArtBoard?.artboard.removeController(voiceStartController);
    riveArtBoard?.artboard.removeController(voiceLoopController);
    riveArtBoard?.artboard.removeController(maximizedController);
    riveArtBoard?.artboard.removeController(minimizeController);
    riveArtBoard?.artboard.removeController(wrongPasswordController);
    riveArtBoard?.artboard.removeController(loadingStartController);
    riveArtBoard?.artboard.removeController(loadingLoopController);
    riveArtBoard?.artboard.removeController(loadingEndController);
  }

//! Backend login
  Future<void> _login() async {
    emit(LoginLoading());
    try {
      final loginData = await authService.login(
        emailController.text,
        passwordController.text,
      );
      debugPrint('====?>>> login cubit:: ${loginData.token}');
      emit(LoginSuccess());
    } on ServerException catch (e) {
      debugPrint('====?>>> login cubit error:: ${e.error.errorMessage}');
      emit(
        LoginFailure(
          errMsg: e.error.errorMessage,
          emailError: e.error.errorDetails?.first ?? '',
          passwordError: e.error.errorDetails?.last ?? '',
        ),
      );
    }
  }
}
