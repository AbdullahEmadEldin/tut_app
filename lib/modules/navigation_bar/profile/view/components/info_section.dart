import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/profile_info_item.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/cubit/edit_user_data_cubit.dart';
import 'package:tut_app/shared/view/widgets/custom_horizontal_divider.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  late TextEditingController phoneController =
      TextEditingController(text: widget.user.phone);
  late TextEditingController emailController =
      TextEditingController(text: widget.user.email);

  final phoneFocusNode = FocusNode();

  bool phoneReadOnly = true;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: UiHelper.gradientContainerColors(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileInfoItem(
            label: AppStrings.email.tr(),
            controller: emailController,
            value: widget.user.email,
            suffixIconData: Icons.email_outlined,
            actionIcon: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.user.email));
                showToast(
                  context,
                  AppStrings.copiedSuccess.tr(),
                );
              },
              icon: Icon(
                Icons.copy,
                color: AppColors().colorScheme.grey,
                size: UiHelper.getResponsiveDimension(context,
                    baseDimension: iconSize),
              ),
            ),
          ),
          const CustomHorizontalDivider(),
          BlocConsumer<EditUserDataCubit, EditUserDataState>(
            listener: (context, state) {
              if (state is EditPhoneNumberSuccess) {
                showToast(
                  context,
                  AppStrings.updatedPhone.tr(),
                );
              } else if (state is EditPhoneNumberFailure) {
                showToast(context, AppStrings.errorMsg.tr(), isError: true);
              }
            },
            builder: (context, state) {
              return ProfileInfoItem(
                label: AppStrings.phoneNumber.tr(),
                controller: phoneController,
                value: widget.user.phone,
                suffixIconData: Icons.phone,
                readOnly: phoneReadOnly,
                focusNode: phoneFocusNode,
                actionIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      phoneFocusNode.requestFocus();
                      if (!phoneReadOnly) {
                        BlocProvider.of<EditUserDataCubit>(context).editPhone(
                            user: widget.user, newPhone: phoneController.text);
                      }
                      phoneReadOnly = !phoneReadOnly;
                    });
                  },
                  icon: state is EditPhoneNumberLoading
                      ? const CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        )
                      : Icon(
                          phoneReadOnly ? Icons.edit : Icons.check,
                          color: AppColors().colorScheme.grey,
                          size: UiHelper.getResponsiveDimension(context,
                              baseDimension: iconSize),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
