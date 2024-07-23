import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/app/onBoarding/model/on_boarding_model.dart';

class OnBoardingPageView extends StatelessWidget {
  final OnBoardingObject onBoardingObject;

  /// #### This for viewing onBoarding details (title, body, image)
  const OnBoardingPageView({
    super.key,
    required this.onBoardingObject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            onBoardingObject.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            onBoardingObject.body,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(onBoardingObject.image),
        ],
      ),
    );
  }
}
