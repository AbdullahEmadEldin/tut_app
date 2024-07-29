import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as rive;
import 'package:tut_app/app/auth/view/pages/register_page.dart';
import 'package:tut_app/app/auth/view/widgets/auth_title.dart';
import 'package:tut_app/app/auth/view/widgets/input_field.dart';
import 'package:tut_app/app/auth/view/widgets/register_button.dart';
import 'package:tut_app/app/auth/view_model/login_cubit/login_cubit.dart';
import 'package:tut_app/app/home/view/page/home_page.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/values_manager.dart';
import 'package:tut_app/view/widgets/toast_message.dart';

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
              showToast(context, AppStrings.loginSuccessMeg);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomePage.routeName, (route) => false);
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
                        const AuthTitle(
                          title: AppStrings.login,
                        ),
                        InputFieldWidget(
                          controller: loginCubit.emailController,
                          labelText: AppStrings.email,
                          hintText: AppStrings.emailHint,
                          validator: (value) {
                            if (value!.isEmpty) AppStrings.emptyFields;
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
                        const SizedBox(height: AppSize.s20),
                        InputFieldWidget(
                          controller: loginCubit.passwordController,
                          labelText: AppStrings.password,
                          hintText: AppStrings.passwordHint,
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
                            if (value!.isEmpty) return AppStrings.emptyFields;
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s40),
                        //! login button
                        RegisterButton(
                          text: AppStrings.login,
                          onTap: () {
                            loginCubit.passwordFocusNode.unfocus();
                            loginCubit.validateEmailAndPassword();
                          },
                          loading: buttonLoading,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(RegisterPage.routeName),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              AppStrings.dontHaveAnAccount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
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
