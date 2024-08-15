import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';

class ErrorRouter extends StatelessWidget {
  const ErrorRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().colorScheme.error,
      body: Center(
        child: Text('HIIIII, There is no router like this '),
      ),
    );
  }
}
