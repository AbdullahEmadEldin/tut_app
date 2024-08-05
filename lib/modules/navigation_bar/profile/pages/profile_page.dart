// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // Background image or any other widget
        Positioned.fill(
          child: Image.asset(
            AppAssets.images.fakeBookCover,
            fit: BoxFit.cover,
          ),
        ),
        // Blur effect
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Blurred Container',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
