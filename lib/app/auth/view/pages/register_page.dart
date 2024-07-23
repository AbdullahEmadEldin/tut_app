// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/app/auth/view/widgets/auth_title.dart';
import 'package:tut_app/app/auth/view/widgets/input_field.dart';
import 'package:tut_app/app/auth/view/widgets/profile_pic_avatar.dart';
import 'package:tut_app/app/auth/view/widgets/register_button.dart';
import 'package:tut_app/app/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/values_manager.dart';

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
              XFile? profilePic;
              if (state is UploadImageSuccess) {
                profilePic = state.image;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  const AuthTitle(title: AppStrings.register),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Center(child: ProfilePicAvatar(profilePic: profilePic)),
                  const SizedBox(height: AppSize.s12),
                  InputFieldWidget(
                    labelText: AppStrings.name,
                    hintText: AppStrings.yourNameEx,
                    controller: registerCubit.nameController,
                    validator: _handleValidation,
                  ),
                  const SizedBox(height: AppSize.s18),
                  InputFieldWidget(
                    labelText: AppStrings.email,
                    hintText: AppStrings.emailHint,
                    controller: registerCubit.emailController,
                    validator: _handleValidation,
                  ),
                  const SizedBox(height: AppSize.s18),
                  InputFieldWidget(
                    labelText: AppStrings.phoneNumber,
                    hintText: AppStrings.phoneNumberHint,
                    controller: registerCubit.phoneController,
                    validator: _handleValidation,
                  ),
                  const SizedBox(height: AppSize.s18),
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
                  RegisterButton(text: AppStrings.register, onTap: () {})
                ],
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
