import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tut_app/app/auth/data/login_animations_enum.dart';
import 'package:tut_app/app/auth/view/widgets/input_field.dart';
import 'package:tut_app/app/auth/view/widgets/register_button.dart';
import 'package:tut_app/app/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/values_manager.dart';

part 'login_animation_part.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit loginCubit;

  ///
  /// define key for text validation
  // ///
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // FocusNode passwordFocusNode = FocusNode();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  // /// artboard of rive file
  // Artboard? riveArtBoard;

  // /// each controller for each single animation of rive file
  // late RiveAnimationController idleStaticController,
  //     idleAnimatedController,
  //     listeningController,
  //     voiceEndController,
  //     voiceStartController,
  //     voiceLoopController,
  //     maximizedController,
  //     minimizeController,
  //     wrongPasswordController,
  //     loadingStartController,
  //     loadingLoopController,
  //     loadingEndController;
  bool enteringEmail = false;
  bool enteringPassword = false;

  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context)
      ..initializeRiveAnimation()
      ..checkForPasswordFocusNodeToChangeAnimationState();

    // /// initializing controllers of animations
    // idleStaticController = SimpleAnimation(LoginAnimations.idleStatic.text);
    // idleAnimatedController = SimpleAnimation(LoginAnimations.idleAnimated.text);
    // listeningController = SimpleAnimation(LoginAnimations.listening.text);
    // voiceEndController = SimpleAnimation(LoginAnimations.voiceEnd.text);
    // voiceStartController = SimpleAnimation(LoginAnimations.voiceStart.text);
    // voiceLoopController = SimpleAnimation(LoginAnimations.voiceLoop.text);
    // maximizedController = SimpleAnimation(LoginAnimations.maximize.text);
    // minimizeController = SimpleAnimation(LoginAnimations.minimize.text);
    // wrongPasswordController =
    //     SimpleAnimation(LoginAnimations.wrongPassword.text);
    // loadingStartController = SimpleAnimation(LoginAnimations.loadingStart.text);
    // loadingLoopController = SimpleAnimation(LoginAnimations.loadingLoop.text);
    // loadingEndController = SimpleAnimation(LoginAnimations.loadingEnd.text);

    // _initializeRiveAnimation();
    // _checkForPasswordFocusNodeToChangeAnimationState();
    // loginCubit.initializeRiveAnimation();
    // loginCubit.checkForPasswordFocusNodeToChangeAnimationState();
    super.initState();
  }

  @override
  void dispose() {
    //passwordFocusNode.removeListener;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppSize.s28),
            loginCubit.riveArtBoard == null
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 300,
                    child: Rive(artboard: loginCubit.riveArtBoard!)),
            Form(
                key: loginCubit.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      InputFieldWidget(
                        controller: loginCubit.emailController,
                        labelText: AppStrings.email,
                        validator: (value) =>
                            value!.isEmpty ? AppStrings.emptyFields : null,
                        onTextChange: (value) {
                          if (value.isNotEmpty && !enteringEmail) {
                            loginCubit.addActiveController(
                                loginCubit.listeningController);
                            enteringEmail = true;
                          }
                        },
                      ),
                      const SizedBox(height: AppSize.s28),
                      InputFieldWidget(
                        controller: loginCubit.passwordController,
                        labelText: AppStrings.password,
                        focusNode: loginCubit.passwordFocusNode,
                        passwordInput: true,
                        onTextChange: (value) {
                          if (value.isEmpty && !enteringPassword) {
                            loginCubit.addActiveController(
                                loginCubit.minimizeController);
                            enteringPassword = true;
                          }
                        },
                        validator: (value) =>
                            value!.isEmpty ? AppStrings.emptyFields : null,
                      ),
                      const SizedBox(height: AppSize.s40),
                      RegisterButton(
                        text: AppStrings.login,
                        onTap: () {
                          loginCubit.passwordFocusNode.unfocus();
                          loginCubit.validateEmailAndPassword();
                        },
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  // void _validateEmailAndPassword() {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     if (formKey.currentState!.validate()) {
  //       loginCubit.login();
  //       _addActiveController(loadingLoopController);
  //     } else {
  //       _addActiveController(wrongPasswordController);
  //     }
  //   });
  // }

  // void _initializeRiveAnimation() {
  //   /// rootBundle Contains all assets embedded in the project
  //   rootBundle.load(AnimationAssets.loginAnimation).then((data) async {
  //     await RiveFile.initialize();

  //     /// hold the complete rive file
  //     final file = RiveFile.import(data);

  //     /// access the animation inside the rive file
  //     final artBoard = file.mainArtboard;
  //     artBoard.addController(idleAnimatedController);
  //     setState(() {
  //       riveArtBoard = artBoard;
  //     });
  //   });
  // }

  /// This method to change animation
  // _addActiveController(RiveAnimationController<dynamic> activeController) {
  //   _removeAllControllers();
  //   riveArtBoard?.artboard.addController(activeController);
  // }

  // _removeAllControllers() {
  //   riveArtBoard?.artboard.removeController(idleStaticController);
  //   riveArtBoard?.artboard.removeController(idleAnimatedController);
  //   riveArtBoard?.artboard.removeController(listeningController);
  //   riveArtBoard?.artboard.removeController(voiceEndController);
  //   riveArtBoard?.artboard.removeController(voiceStartController);
  //   riveArtBoard?.artboard.removeController(voiceLoopController);
  //   riveArtBoard?.artboard.removeController(maximizedController);
  //   riveArtBoard?.artboard.removeController(minimizeController);
  //   riveArtBoard?.artboard.removeController(wrongPasswordController);
  //   riveArtBoard?.artboard.removeController(loadingStartController);
  //   riveArtBoard?.artboard.removeController(loadingLoopController);
  //   riveArtBoard?.artboard.removeController(loadingEndController);
  //   enteringEmail = false;
  //   enteringPassword = false;
  // }

  // /// without this method ,the animation will not be triggered after the password focus node is unfocused
  // void _checkForPasswordFocusNodeToChangeAnimationState() {
  //   passwordFocusNode.addListener(() {
  //     if (passwordFocusNode.hasFocus) {
  //       _addActiveController(minimizeController);
  //     } else if (!passwordFocusNode.hasFocus) {
  //       _addActiveController(maximizedController);
  //     }
  //   });
  // }
}
