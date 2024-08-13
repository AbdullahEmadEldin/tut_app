import 'package:flutter/material.dart';
import 'package:tut_app/modules/auth/view/widgets/profile_pic_avatar.dart';
import 'package:tut_app/modules/navigation_bar/profile/data/models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 72),
        ProfilePicAvatar(
          profileAvatar: NetworkImage(user.profilePic),
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
