// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';

class LibraryPage extends StatelessWidget {
  static const String routeName = '/library';
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            RegisterButton(
                width:
                    Helper.getResponsiveDimension(context, baseDimension: 200),
                height:
                    Helper.getResponsiveDimension(context, baseDimension: 50),
                text: 'This is library',
                onTap: () {}),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
