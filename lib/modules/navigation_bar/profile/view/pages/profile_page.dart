import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/auth/view/pages/login_page.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/info_section.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/profile_header.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/settings_section.dart';
import 'package:tut_app/modules/navigation_bar/profile/view/components/profile_page_shimmer.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/cubit/edit_user_data_cubit.dart';

import 'package:tut_app/modules/navigation_bar/profile/view_model/logout/logout_cubit.dart';
import 'package:tut_app/modules/navigation_bar/profile/view_model/user_data_cubit/get_user_data_cubit.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late GetUserDataCubit getUserDataCubit;
  bool _logoutLoading = false;
  @override
  void initState() {
    getUserDataCubit = BlocProvider.of<GetUserDataCubit>(context);
    getUserDataCubit.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
      listeners: [
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoading) {
              _logoutLoading = true;
            } else if (state is LogoutSuccess) {
              Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            } else if (state is LogoutFailure) {
              _logoutLoading = false;
              showToast(context, AppStrings.errorLogout.tr(), isError: true);
            }
          },
        ),

        /// Check docs in //! EditUserDataState
        BlocListener<EditUserDataCubit, EditUserDataState>(
          listener: (context, state) {
            if (state is UserUpdatedState) {
              //? This is the way I figured to update the state without make API call again
              //? It's consider as a way to communicate between cubits each other.
              context
                  .read<GetUserDataCubit>()
                  .updateUser(updatedUser: state.updatedUser);
            }

            if (state is EditPictureSuccess) {
              /// as image XFile is hard to convert to String, we will make an API call this time.
              context.read<GetUserDataCubit>().getUserData();
            }
          },
        ),
      ],
      child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataLoading) {
            return const ProfileShimmer();
            //
          } else if (state is GetUserDataFailure) {
            return Text('==> //${state.errorMessage}');
            //
          } else if (state is GetUserDataSuccess) {
            //
            final user = state.userData;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfileHeader(user: user),
                  ),
                  //const SizedBox(height: 16),
                  _sectionName(context, AppStrings.userInfo.tr()),
                  InfoSection(user: user),
                  _sectionName(context, AppStrings.settings.tr()),
                  const SettingsSection(),
                ],
              ),
            );
          } else {
            return Text('==> Fucking error ${state.toString()}');
          }
        },
      ),
    ));
  }

  Padding _sectionName(BuildContext context, String sectionName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        sectionName,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
