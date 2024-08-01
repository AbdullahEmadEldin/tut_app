// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/auth/view/widgets/auth_title.dart';
import 'package:tut_app/modules/auth/view/widgets/input_field.dart';
import 'package:tut_app/modules/auth/view/widgets/profile_pic_avatar.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/modules/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/modules/navigation_bar/home/view/page/home_page.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/values_manager.dart';
import 'package:tut_app/view/widgets/toast_message.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              /// for register button loading
              bool isLoading = false;

              if (state is RegisterLoading) isLoading = true;
              if (state is RegisterFailure) {
                isLoading = false;
                showToast(context, state.errMsg, isError: true);
              }
              if (state is RegisterSuccess) {
                showToast(
                  context,
                  state.message,
                );
                isLoading = false;
                // this delay to wait for the toast message
                //as it throw error of dirty widget marked to be builded during HomePage build
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomePage.routeName, (Route<dynamic> route) => false);
                });
              }

              return Form(
                key: registerCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    //! title
                    const AuthTitle(title: AppStrings.register),
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                    //! profile pic
                    Center(child: ProfilePicAvatar()),
                    const SizedBox(height: AppSize.s12),
                    //! name
                    InputFieldWidget(
                      labelText: AppStrings.name,
                      hintText: AppStrings.yourNameEx,
                      controller: registerCubit.nameController,
                      validator: _handleValidation,
                    ),
                    const SizedBox(height: AppSize.s18),
                    //! email
                    InputFieldWidget(
                      labelText: AppStrings.email,
                      hintText: AppStrings.emailHint,
                      controller: registerCubit.emailController,
                      validator: _handleValidation,
                    ),
                    const SizedBox(height: AppSize.s18),
                    //! phone
                    InputFieldWidget(
                      labelText: AppStrings.phoneNumber,
                      hintText: AppStrings.phoneNumberHint,
                      controller: registerCubit.phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        _handleValidation(value);
                        if (value!.length < 10)
                          return AppStrings.phoneNumberValidation;
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.s18),
                    //! password
                    InputFieldWidget(
                      labelText: AppStrings.password,
                      hintText: AppStrings.passwordHint,
                      controller: registerCubit.passwordController,
                      passwordInput: true,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return AppStrings.emptyFields;
                        if (value.length < 8) return AppStrings.passwordHint;
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.s18),
                    //! confirm password
                    InputFieldWidget(
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.confirmPasswordHint,
                      controller: registerCubit.confirmPasswordController,
                      passwordInput: true,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty)
                          return AppStrings.emptyFields;
                        if (p0 != registerCubit.passwordController.text)
                          return AppStrings.passwordNotMatch;
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.s18),
                    //! register button
                    RegisterButton(
                        text: AppStrings.register,
                        loading: isLoading,
                        onTap: () {
                          registerCubit.validateRegisterDataAndSignUp();
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(LoginPage.routeName),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              AppStrings.alreadyHaveAnAccount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String? _handleValidation(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }
}
