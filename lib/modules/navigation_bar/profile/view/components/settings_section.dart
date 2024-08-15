import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/core/theme/theme_manager.dart';
import 'package:tut_app/core/ui_helpers.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/pop_menu_component.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/setting_item.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/widgets/switch_value.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/logout/logout_cubit.dart';
import 'package:tut_app/shared/view/widgets/custom_horizontal_divider.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
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
            actionIcon: ValueSwitcher(
              onChanged: (value) {
                print('===> $value');
                CacheHelper.saveData(
                    key: AppConstants.sharedPrefKeys.isDark, value: value);
                AppThemes.instance.updateThemeValue(value);
                AppColors().updateTheme(value);
                setState(() {});
              },
            ),
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
            title: AppStrings.aboutUs.tr(),
            suffixIconData: Icons.error_outline,
            actionIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors().colorScheme.grey,
                size: 20,
              ),
            ),
          ),
          const CustomHorizontalDivider(),
          SettingsItem(
            title: AppStrings.logout.tr(),
            suffixIconData: Icons.logout_rounded,
            actionIcon: IconButton(
              onPressed: () => BlocProvider.of<LogoutCubit>(context).logout(),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors().colorScheme.grey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
