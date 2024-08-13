import 'package:flutter/material.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/constants/values_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';

class ProfilePicAvatar extends StatelessWidget {
  final ImageProvider<Object>? profileAvatar;
  final Function()? onPressed;
  const ProfilePicAvatar({
    super.key,
    required this.profileAvatar,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Using Stack to put the camera picker button on top-side of the avatar
    return Stack(
      children: [
        SizedBox(
          height: UiHelper.getResponsiveDimension(context, baseDimension: 130),
          width: UiHelper.getResponsiveDimension(context, baseDimension: 160),
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            backgroundImage: profileAvatar,
          ),
        ),
        Positioned(
          bottom: 10,
          right: -1,
          child: Container(
            width: AppSize.s50,
            height: AppSize.s50,
            decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
            child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
