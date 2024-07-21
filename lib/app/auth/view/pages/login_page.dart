import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:tut_app/app/auth/data/login_animations_enum.dart';
import 'package:tut_app/app/auth/view/widgets/register_button.dart';
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
  /// artboard of rive file
  Artboard? riveArtBoard;

  /// each controller for each single animation of rive file
  late RiveAnimationController idleStaticController,
      idleAnimatedController,
      listeningController,
      voiceEndController,
      voiceStartController,
      voiceLoopController,
      maximizedController,
      minimizeController,
      wrongPasswordController,
      loadingStartController,
      loadingLoopController,
      loadingEndController;
  bool enteringEmail = false;
  bool enteringPassword = false;

  String testEmail = 'abc';
  String testPassword = '123';

  ///
  /// define key for text validation
  ///
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void initState() {
    /// initializing controllers of animations
    idleStaticController = SimpleAnimation(LoginAnimations.idleStatic.text);
    idleAnimatedController = SimpleAnimation(LoginAnimations.idleAnimated.text);
    listeningController = SimpleAnimation(LoginAnimations.listening.text);
    voiceEndController = SimpleAnimation(LoginAnimations.voiceEnd.text);
    voiceStartController = SimpleAnimation(LoginAnimations.voiceStart.text);
    voiceLoopController = SimpleAnimation(LoginAnimations.voiceLoop.text);
    maximizedController = SimpleAnimation(LoginAnimations.maximize.text);
    minimizeController = SimpleAnimation(LoginAnimations.minimize.text);
    wrongPasswordController =
        SimpleAnimation(LoginAnimations.wrongPassword.text);
    loadingStartController = SimpleAnimation(LoginAnimations.loadingStart.text);
    loadingLoopController = SimpleAnimation(LoginAnimations.loadingLoop.text);
    loadingEndController = SimpleAnimation(LoginAnimations.loadingEnd.text);

    _initializeRiveAnimation();
    _checkForPasswordFocusNodeToChangeAnimationState();
    super.initState();
  }

  @override
  void dispose() {
    passwordFocusNode.removeListener;
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
            riveArtBoard == null
                ? const SizedBox.shrink()
                : SizedBox(height: 300, child: Rive(artboard: riveArtBoard!)),
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                            value != testEmail ? 'Error' : null,
                        decoration: InputDecoration(
                          labelText: AppStrings.email,
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppMargin.m8),
                            borderSide: BorderSide(
                                color: AppColors.greyPrimary, width: 0.5),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && !enteringEmail) {
                            print('ddd');
                            _addActiveController(listeningController);
                            enteringEmail = true;
                          }
                        },
                      ),
                      const SizedBox(height: AppSize.s28),
                      TextFormField(
                        validator: (value) =>
                            value != testPassword ? 'Error' : null,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: AppStrings.password,
                          labelStyle: Theme.of(context).textTheme.bodyLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppMargin.m8),
                            borderSide: BorderSide(
                                color: AppColors.greyPrimary, width: 0.5),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty && !enteringPassword) {
                            _addActiveController(minimizeController);
                            enteringPassword = true;
                          }
                        },
                      ),
                      const SizedBox(height: AppSize.s40),
                      RegisterButton(
                        text: AppStrings.login,
                        onTap: () {
                          passwordFocusNode.unfocus();

                          _validateEmailAndPassword();
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

  void _validateEmailAndPassword() {
    Future.delayed(Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        _addActiveController(loadingLoopController);
      } else {
        _addActiveController(wrongPasswordController);
      }
    });
  }

  void _initializeRiveAnimation() {
    /// rootBundle Contains all assets embedded in the project
    rootBundle.load(AnimationAssets.loginAnimation).then((data) async {
      await RiveFile.initialize();

      /// hold the complete rive file
      final file = RiveFile.import(data);

      /// access the animation inside the rive file
      final artBoard = file.mainArtboard;
      artBoard.addController(idleAnimatedController);
      setState(() {
        riveArtBoard = artBoard;
      });
    });
  }

  _addActiveController(RiveAnimationController<dynamic> activeController) {
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
    enteringEmail = false;
    enteringPassword = false;
  }

  void _checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        _addActiveController(minimizeController);
      } else if (!passwordFocusNode.hasFocus) {
        _addActiveController(maximizedController);
      }
    });
  }
}
