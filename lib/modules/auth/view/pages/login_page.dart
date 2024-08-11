import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as rive;
import 'package:tut_app/modules/auth/view/widgets/auth_title.dart';
import 'package:tut_app/modules/auth/view/widgets/dont_have_account_button.dart';
import 'package:tut_app/modules/auth/view/widgets/input_field.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/modules/auth/view/widgets/stay_logged_checkbox.dart';
import 'package:tut_app/modules/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/modules/navigation_bar/animated_bottom_bar.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/constants/values_manager.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit loginCubit;

  bool enteringEmail = false;
  bool enteringPassword = false;
  bool buttonLoading = false;

  String? emailError;
  String? passwordError;
  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context)
      ..initializeRiveAnimation().then((value) => setState(() {
            // this setState to avoid latency of rive animation or not viewing for the first time.
          }))
      ..checkForPasswordFocusNodeToChangeAnimationState();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              setState(() {
                buttonLoading = true;
              });
              loginCubit.addActiveController(loginCubit.loadingLoopController);

              //
            } else if (state is LoginSuccess) {
              loginCubit.addActiveController(loginCubit.loadingEndController);
              buttonLoading = false;
              showToast(context, AppStrings.loginSuccessMeg.tr());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AnimatedBottomBar.routeName, (route) => false);
              //
            } else if (state is LoginFailure) {
              _handleFailureLoginAnimation(context, state);

              emailError = state.emailError ?? '';
              passwordError = state.passwordError ?? '';
              showToast(context, state.errMsg + emailError! + passwordError!,
                  isError: true);
              loginCubit.formKey.currentState?.validate();
              setState(() {
                buttonLoading = false;
              });
            }
          },
          child: Column(
            children: [
              const SizedBox(height: AppSize.s28),
              loginCubit.riveArtBoard == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 300,
                      child: rive.Rive(artboard: loginCubit.riveArtBoard!)),
              Form(
                  key: loginCubit.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AuthTitle(
                          title: AppStrings.login.tr(),
                        ),
                        InputFieldWidget(
                          controller: loginCubit.emailController,
                          labelText: AppStrings.email.tr(),
                          hintText: AppStrings.emailHint.tr(),
                          validator: (value) {
                            if (value!.isEmpty) AppStrings.emptyFields.tr();
                            return null;
                          },
                          onTextChange: (value) {
                            if (value.isNotEmpty && !enteringEmail) {
                              loginCubit.addActiveController(
                                  loginCubit.listeningController);
                              enteringEmail = true;
                            }
                          },
                        ),
                        const StayLoggedCheckBox(),
                        const SizedBox(height: AppSize.s20),
                        InputFieldWidget(
                          controller: loginCubit.passwordController,
                          labelText: AppStrings.password.tr(),
                          hintText: AppStrings.passwordHint.tr(),
                          focusNode: loginCubit.passwordFocusNode,
                          passwordInput: true,
                          onTextChange: (value) {
                            if (value.isEmpty && !enteringPassword) {
                              loginCubit.addActiveController(
                                  loginCubit.minimizeController);
                              enteringPassword = true;
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty)
                              return AppStrings.emptyFields.tr();
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s40),

                        //! login button
                        RegisterButton(
                          text: AppStrings.login.tr(),
                          onTap: () {
                            loginCubit.passwordFocusNode.unfocus();
                            loginCubit.validateEmailAndPassword();
                          },
                          loading: buttonLoading,
                        ),
                        const DontHaveAccountButton()
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  /// shared validation handled here...
  void _handleFailureLoginAnimation(BuildContext context, LoginFailure state) {
    Future.delayed(const Duration(milliseconds: 1200), () {
      loginCubit.addActiveController(loginCubit.loadingEndController);
    });
    Future.delayed(const Duration(seconds: 2), () {
      loginCubit.addActiveController(loginCubit.wrongPasswordController);
    });

    showToast(context, state.errMsg, isError: true);
  }
}
