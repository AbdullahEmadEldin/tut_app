import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';

class PopMenuComponent extends StatelessWidget {
  final Object? initialValue;
  final List<PopupMenuEntry<Object?>> items;
  const PopMenuComponent({
    super.key,
    required this.initialValue,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.background,
      padding: EdgeInsets.zero,
      initialValue: initialValue,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.grey,
      ),
      iconSize: 30,
      itemBuilder: (context) => items,
    );
  }
}
