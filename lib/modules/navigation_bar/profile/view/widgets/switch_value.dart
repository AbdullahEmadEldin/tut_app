import 'package:flutter/material.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/theme/theme_manager.dart';

class ValueSwitcher extends StatefulWidget {
  final Function(bool)? onChanged;
  const ValueSwitcher({
    super.key,
    required this.onChanged,
  });

  @override
  State<ValueSwitcher> createState() => _ValueSwitcherState();
}

class _ValueSwitcherState extends State<ValueSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Transform.scale(
        scale: 1.4,
        child: Switch(
          splashRadius: 40,
          activeTrackColor: AppColors().colorScheme.black,
          inactiveTrackColor: AppColors().colorScheme.error.withOpacity(0.2),
          thumbColor: WidgetStateProperty.all(Colors.redAccent
              .withOpacity(0.5)), // Colors.redAccent.withOpacity(0.7),
          trackOutlineColor:
              WidgetStateProperty.resolveWith((final Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return null;
            } else {
              return Colors.transparent;
            }
          }),
          value: CacheHelper.getData(key: AppConstants.sharedPrefKeys.isDark) ??
              false,
          activeThumbImage: AssetImage(AppAssets.images.nightMode),
          inactiveThumbImage: AssetImage(AppAssets.images.lightMode),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
