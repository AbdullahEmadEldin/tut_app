import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/constants/values_manager.dart';

class RegisterButton extends StatelessWidget {
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final void Function()? onTap;
  const RegisterButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // not clickable when loading to avoid multiple requests
      onTap: !loading ? onTap : null,
      child: Ink(
        height: height ?? AppSize.s50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors().colorScheme.primary,
          borderRadius: BorderRadius.circular(AppMargin.m8),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
