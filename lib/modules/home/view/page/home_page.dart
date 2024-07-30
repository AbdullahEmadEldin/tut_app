// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'statttttt',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.secondary),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.secondary,
        child: Row(
          children: [
            Icon(CupertinoIcons.book_fill),
          ],
        ),
      ),
    );
  }
}
