import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/modules/onBoarding/view_model/on_boarding_view_model.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class OnBoardingBottomSheetWidget extends StatefulWidget {
  final OnBoardingViewModel viewModel;
  final void Function() onNextFunction;
  final void Function() onBackFunction;
  final void Function() onSkipFunction;

  /// #### View navigation between pages buttons and skip to Login page
  const OnBoardingBottomSheetWidget({
    super.key,
    required this.viewModel,
    required this.onNextFunction,
    required this.onBackFunction,
    required this.onSkipFunction,
  });

  @override
  State<OnBoardingBottomSheetWidget> createState() =>
      _OnBoardingBottomSheetWidgetState();
}

class _OnBoardingBottomSheetWidgetState
    extends State<OnBoardingBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: widget.onSkipFunction,
            child: Text(
              AppStrings.skip.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.onBackFunction();
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: widget.viewModel.currentIndex == 0
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                ),
                Row(children: [
                  /// why not use .map call back?
                  /// because we need to get the index and if we use .map code will be messy.
                  for (int i = 0;
                      i < widget.viewModel.getOnBoardingObjects().length;
                      i++)
                    _indexContainer(i),
                ]),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.onNextFunction();
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: widget.viewModel.currentIndex ==
                            widget.viewModel.getOnBoardingObjects().length - 1
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// This method draw num of container based on num of pages
  /// and determine color of the selected container.
  Container _indexContainer(int i) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: widget.viewModel.currentIndex == i
              ? Colors.transparent
              : AppColors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.white)),
    );
  }
}
