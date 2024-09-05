import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/modules/auth/view_model/login_cubit/login_cubit.dart';

class StayLoggedCheckBox extends StatefulWidget {
  const StayLoggedCheckBox({
    super.key,
  });

  @override
  State<StayLoggedCheckBox> createState() => _StayLoggedCheckBoxState();
}

class _StayLoggedCheckBoxState extends State<StayLoggedCheckBox> {
  bool stayLoggedInUi = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
            splashRadius: 5,
            value: stayLoggedInUi,
            onChanged: (val) {
              // handling both storage value and state value
              if (!stayLoggedInUi) {
                context.read<LoginCubit>().rememberMe = true;
                print(
                    '==========555555 ${context.read<LoginCubit>().rememberMe}');
                stayLoggedInUi = true;
              } else {
                context.read<LoginCubit>().rememberMe = false;
                stayLoggedInUi = false;
                print(
                    '==========22222222222222 ${context.read<LoginCubit>().rememberMe}');
              }

              setState(() {});
            }),
        Text(
          AppStrings.stayLoggedIn.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
