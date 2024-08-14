import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/auth/view/widgets/profile_pic_avatar.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/cubit/edit_user_data_cubit.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class ProfileHeader extends StatefulWidget {
  final UserModel user;
  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  // edit name vars
  late TextEditingController nameController =
      TextEditingController(text: widget.user.name);
  final FocusNode nameFocusNode = FocusNode();
  //
  bool readOnly = true;
  bool _picSelection = false;
  //
  late EditUserDataCubit editDataCubit;

  @override
  void initState() {
    editDataCubit = BlocProvider.of<EditUserDataCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditUserDataCubit, EditUserDataState>(
      listener: (context, state) {
        if (state is EditNameSuccess) {
          showToast(context, AppStrings.updatedName.tr());
        } else if (state is EditNameFailure || state is EditPictureFailure) {
          showToast(context, AppStrings.errorMsg.tr(), isError: true);
        }
        if (state is EditPictureSuccess) {
          showToast(context, AppStrings.updatedPic.tr());
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 72),
            ProfilePicAvatar(
              checkIcon: _picSelection,
              isLoading: state is EditPictureLoading,
              profileAvatar: _picSelection
                  ? FileImage(
                      File(editDataCubit.profilePic!.path),
                    )
                  : NetworkImage(widget.user.profilePic),
              onPressed: () async {
                XFile? pic;

                /// _picSelection is the action controller to avoid multiple actions on the same click
                /// It act as a button switcher as it two button with two different actions and icons.
                if (!_picSelection) {
                  pic = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  // this condition to avoid error if user didn't pick an image after opening the gallery.
                  if (pic == null) return;
                  _picSelection = true;
                  setState(() {
                    // set the image to the cubit state
                    editDataCubit.updateImage(image: pic!);
                  });
                  //
                } else {
                  // upload the pic to backend
                  editDataCubit.uploadPic(user: widget.user);
                  setState(() {
                    _picSelection = false;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            IntrinsicWidth(
              child: TextField(
                readOnly: readOnly,
                focusNode: nameFocusNode,
                controller: nameController,
                style: Theme.of(context).textTheme.headlineLarge,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        // focus the text field when user wants to edit the name
                        nameFocusNode.requestFocus();
                        if (!readOnly) {
                          editDataCubit.editName(
                              user: widget.user, newName: nameController.text);
                        }
                        readOnly = !readOnly;
                      });
                    },
                    icon: state is EditNameLoading
                        ? const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          )
                        : Icon(
                            readOnly ? Icons.edit : Icons.check,
                            color: AppColors.grey,
                            size: 30,
                          ),
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
