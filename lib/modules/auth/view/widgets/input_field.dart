import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/constants/values_manager.dart';

class InputFieldWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onTextChange;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool passwordInput;
  final TextInputType? keyboardType;
  const InputFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.onTextChange,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.passwordInput = false,
    this.keyboardType,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          focusNode: widget.focusNode,
          obscureText: widget.passwordInput ? securePassword : false,
          keyboardType: widget.keyboardType,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              letterSpacing:
                  widget.keyboardType == TextInputType.number ? 5 : 0),
          decoration: InputDecoration(
            suffixIcon: widget.passwordInput
                ? IconButton(
                    icon: securePassword
                        ? Icon(
                            Icons.remove_red_eye,
                            color: AppColors().colorScheme.primary,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors().colorScheme.primary,
                          ),
                    onPressed: () => {
                      setState(() {
                        securePassword = !securePassword;
                      })
                    },
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors().colorScheme.darkGrey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppMargin.m8),
              borderSide:
                  BorderSide(color: AppColors().colorScheme.grey, width: 0.0),
            ),
          ),
          onChanged: widget.onTextChange,
        ),
      ],
    );
  }
}
