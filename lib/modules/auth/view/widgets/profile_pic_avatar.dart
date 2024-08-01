import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/modules/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/constants/values_manager.dart';

class ProfilePicAvatar extends StatelessWidget {
  const ProfilePicAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Using Stack to put the camera picker button on top-side of the avatar
    final registerCubit = context.read<RegisterCubit>();
    return Stack(
      children: [
        SizedBox(
          height: AppSize.s130,
          width: AppSize.s160,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            backgroundImage: registerCubit.profilePic == null
                ? AssetImage(AppAssets.images.avatar)
                : FileImage(File(registerCubit.profilePic!.path)),
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
                onPressed: () async {
                  final pic = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  // this condition to avoid error if user didn't pick an image after opening the gallery.
                  if (pic == null) return;
                  // set the image to the cubit
                  registerCubit.uploadImage(image: pic);
                },
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
