import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/values_manager.dart';

class InputFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final void Function(String)? onTextChange;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool passwordInput;
  const InputFieldWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.onTextChange,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.passwordInput = false,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      focusNode: widget.focusNode,
      obscureText: widget.passwordInput ? securePassword : false,
      decoration: InputDecoration(
        suffixIcon: widget.passwordInput
            ? IconButton(
                icon: securePassword
                    ? Icon(
                        Icons.remove_red_eye,
                        color: AppColors.primary,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.primary,
                      ),
                onPressed: () => {
                  setState(() {
                    securePassword = !securePassword;
                  })
                },
              )
            : widget.suffixIcon,
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppMargin.m8),
          borderSide: BorderSide(color: AppColors.greyPrimary, width: 0.1),
        ),
      ),
      onChanged: widget.onTextChange,
    );
  }
}
