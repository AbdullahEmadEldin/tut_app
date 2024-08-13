import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.grey,
      indent: 10,
      endIndent: 10,
      thickness: 0.5,
    );
  }
}
