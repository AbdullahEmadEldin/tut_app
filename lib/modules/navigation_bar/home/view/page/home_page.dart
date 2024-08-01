// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/banner_slider.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/falsh_sale_text.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlashSaleText(),
              BannerSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
