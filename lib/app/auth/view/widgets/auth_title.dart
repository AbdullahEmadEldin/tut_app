import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  const AuthTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
