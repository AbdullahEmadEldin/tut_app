import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';

class IconActionButton extends StatefulWidget {
  final Widget icon;
  final bool isAvailable;
  final Function()? onTap;
  const IconActionButton({
    super.key,
    required this.icon,
    this.isAvailable = true,
    this.onTap,
  });

  @override
  State<IconActionButton> createState() => _IconActionButtonState();
}

class _IconActionButtonState extends State<IconActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: !widget.isAvailable
                ? AppColors().colorScheme.darkGrey.withOpacity(0.7)
                : null,
            borderRadius: BorderRadius.circular(32),
            gradient: widget.isAvailable
                ? LinearGradient(colors: [
                    AppColors().colorScheme.spotColor,
                    //AppColors().colorScheme.primaryGrade4,
                    AppColors().colorScheme.secondary
                  ])
                : null,
          ),
          child: widget.icon,
        ),
      ),
    );
  }
}
