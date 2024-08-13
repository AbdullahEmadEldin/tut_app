import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/profile_info_item.dart';
import 'package:tut_app/shared/view/widgets/custom_horizontal_divider.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: UiHelper.gradientContainerColors(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileInfoItem(
            label: AppStrings.email.tr(),
            value: user.email,
            suffixIconData: Icons.email_outlined,
            actionIcon: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: user.email));
                showToast(
                  context,
                  AppStrings.copiedSuccess.tr(),
                );
              },
              icon: const Icon(
                Icons.copy,
                color: AppColors.grey,
                size: iconSize,
              ),
            ),
          ),
          const CustomHorizontalDivider(),
          ProfileInfoItem(
            label: AppStrings.phoneNumber.tr(),
            value: user.phone,
            suffixIconData: Icons.phone,
            actionIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppColors.grey,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
