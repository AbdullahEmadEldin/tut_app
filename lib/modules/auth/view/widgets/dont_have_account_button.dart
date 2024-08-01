import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/auth/view/pages/register_page.dart';

class DontHaveAccountButton extends StatelessWidget {
  const DontHaveAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushReplacementNamed(RegisterPage.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          AppStrings.dontHaveAnAccount,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
