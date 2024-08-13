import 'package:flutter/material.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class ValueSwitcher extends StatefulWidget {
  const ValueSwitcher({super.key});

  @override
  State<ValueSwitcher> createState() => _ValueSwitcherState();
}

class _ValueSwitcherState extends State<ValueSwitcher> {
  bool svalue = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Transform.scale(
        scale: 1.4,
        child: Switch(
          splashRadius: 40,
          inactiveTrackColor: AppColors.black,
          activeTrackColor: AppColors.error.withOpacity(0.2),
          thumbColor: WidgetStateProperty.all(Colors.redAccent
              .withOpacity(0.6)), // Colors.redAccent.withOpacity(0.7),
          trackOutlineColor:
              WidgetStateProperty.resolveWith((final Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return null;
            } else {
              return Colors.transparent;
            }
          }),
          value: svalue,
          inactiveThumbImage: AssetImage(AppAssets.images.nightMode),
          activeThumbImage: AssetImage(AppAssets.images.lightMode),
          onChanged: (value) {
            setState(() {});
            svalue = value;
          },
        ),
      ),
    );
  }
}
