// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/auth/view/widgets/auth_title.dart';
import 'package:tut_app/modules/auth/view/widgets/input_field.dart';
import 'package:tut_app/modules/auth/view/widgets/profile_pic_avatar.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/modules/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '${LoginPage.routeName}/register';
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
                      LoginPage.routeName, (Route<dynamic> route) => false);
                });
              }
              return Form(
                key: registerCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(
                        context,
                        baseDimension: 20.h,
                      ),
                    ),
                    //! title
                    AuthTitle(title: AppStrings.register.tr()),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(
                        context,
                        baseDimension: 4.h,
                      ),
                    ),
                    //! profile pic
                    Center(
                      child: ProfilePicAvatar(
                        profileAvatar: registerCubit.profilePic == null
                            ? AssetImage(AppAssets.images.avatar)
                            : FileImage(
                                File(registerCubit.profilePic!.path),
                              ),
                        onPressed: () async {
                          final pic = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          // this condition to avoid error if user didn't pick an image after opening the gallery.
                          if (pic == null) return;
                          // set the image to the cubit
                          // if user didn't pick an image we will use the default avatar
                          // it's handled in the converting method to MultipartFile method.
                          registerCubit.uploadImage(image: pic);
                        },
                      ),
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 6.h),
                    ),
                    //! name
                    InputFieldWidget(
                      labelText: AppStrings.name.tr(),
                      hintText: AppStrings.yourNameEx.tr(),
                      controller: registerCubit.nameController,
                      validator: _handleValidation,
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 18.h),
                    ),
                    //! email
                    InputFieldWidget(
                      labelText: AppStrings.email.tr(),
                      hintText: AppStrings.emailHint.tr(),
                      controller: registerCubit.emailController,
                      validator: _handleValidation,
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 18.h),
                    ),
                    //! phone
                    InputFieldWidget(
                      labelText: AppStrings.phoneNumber.tr(),
                      hintText: AppStrings.phoneNumberHint.tr(),
                      controller: registerCubit.phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        _handleValidation(value);
                        if (value!.length < 10)
                          return AppStrings.phoneNumberValidation.tr();
                        return null;
                      },
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 18.h),
                    ),
                    //! password
                    InputFieldWidget(
                      labelText: AppStrings.password.tr(),
                      hintText: AppStrings.passwordHint.tr(),
                      controller: registerCubit.passwordController,
                      passwordInput: true,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return AppStrings.emptyFields.tr();
                        if (value.length < 8)
                          return AppStrings.passwordHint.tr();
                        return null;
                      },
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 18.h),
                    ),
                    //! confirm password
                    InputFieldWidget(
                      labelText: AppStrings.confirmPassword.tr(),
                      hintText: AppStrings.confirmPasswordHint.tr(),
                      controller: registerCubit.confirmPasswordController,
                      passwordInput: true,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty)
                          return AppStrings.emptyFields.tr();
                        if (p0 != registerCubit.passwordController.text)
                          return AppStrings.passwordNotMatch.tr();
                        return null;
                      },
                    ),
                    SizedBox(
                      height: UiHelper.getResponsiveDimension(context,
                          baseDimension: 18.h),
                    ),
                    //! register button
                    RegisterButton(
                        text: AppStrings.register.tr(),
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
                              AppStrings.alreadyHaveAnAccount.tr(),
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
      return AppStrings.emptyFields.tr();
    }
    return null;
  }
}
