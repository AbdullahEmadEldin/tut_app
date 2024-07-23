import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/app/auth/view_model/register/register_cubit.dart';
import 'package:tut_app/core/assets_paths.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/values_manager.dart';

class ProfilePicAvatar extends StatelessWidget {
  const ProfilePicAvatar({
    super.key,
    required this.profilePic,
  });

  final XFile? profilePic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppSize.s130,
          width: AppSize.s160,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            backgroundImage: profilePic == null
                ? const AssetImage(ImagesAssets.avatar)
                : FileImage(File(profilePic!.path)),
          ),
        ),
        Positioned(
          bottom: 10,
          right: -1,
          child: Container(
            width: AppSize.s50,
            height: AppSize.s50,
            decoration: BoxDecoration(
                color: AppColors.grey,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
            child: IconButton(
                onPressed: () => ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      context.read<RegisterCubit>().uploadImage(image: value!);
                    }),
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
