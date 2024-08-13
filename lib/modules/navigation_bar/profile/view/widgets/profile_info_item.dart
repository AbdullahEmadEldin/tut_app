import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';

class ProfileInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData suffixIconData;
  final Widget actionIcon;

  const ProfileInfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.actionIcon,
    required this.suffixIconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              suffixIconData,
              color: AppColors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.grey2),
            ),
          ],
        ),
        SizedBox(
          width: UiHelper.getResponsiveDimension(context, baseDimension: 170),
          child: TextField(
            readOnly: true,
            controller: TextEditingController(
              text: value,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              suffixIcon: actionIcon,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
