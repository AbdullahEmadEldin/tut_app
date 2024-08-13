import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/pop_menu_component.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/setting_item.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/switch_value.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/logout/logout_cubit.dart';
import 'package:tut_app/shared/view/widgets/custom_horizontal_divider.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: UiHelper.gradientContainerColors(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingsItem(
            title: AppStrings.theme.tr(),
            suffixIconData: Icons.mode_night_outlined,
            actionIcon: const ValueSwitcher(),
          ),
          const CustomHorizontalDivider(),
          SettingsItem(
            title: AppStrings.language.tr(),
            suffixIconData: Icons.language,
            actionIcon: PopMenuComponent(
                initialValue: context.locale.languageCode,
                items: LanguageType.values
                    .map(
                      (lang) => PopupMenuItem(
                          child: Text(
                            lang.name.tr(),
                          ),
                          onTap: () => LanguageManager.changeAppLang(context,
                              lang: lang)),
                    )
                    .toList()),
          ),
          const CustomHorizontalDivider(),
          SettingsItem(
            title: AppStrings.logout.tr(),
            suffixIconData: Icons.logout_rounded,
            actionIcon: IconButton(
              onPressed: () => BlocProvider.of<LogoutCubit>(context).logout(),
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
                size: 20,
              ),
            ),
          ),
          const CustomHorizontalDivider(),
          SettingsItem(
            title: AppStrings.aboutUs.tr(),
            suffixIconData: Icons.error_outline,
            actionIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
