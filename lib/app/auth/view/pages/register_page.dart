import 'package:flutter/material.dart';
import 'package:tut_app/app/auth/view/widgets/auth_title.dart';
import 'package:tut_app/app/auth/view/widgets/input_field.dart';
import 'package:tut_app/core/app_strings.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/values_manager.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const AuthTitle(title: AppStrings.register),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: AppSize.s130,
                width: AppSize.s130,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  backgroundImage: const AssetImage(ImagesAssets.avatar),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InputFieldWidget(labelText: AppStrings.name)
            ],
          ),
        ),
      ),
    );
  }
}
