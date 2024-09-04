import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
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
  bool loginSuccess = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              loginSuccess = true;
            }
          },
          child: Checkbox(
              splashRadius: 5,
              value: stayLoggedInUi,
              onChanged: (val) {
                // handling both storage value and state value
                if (stayLoggedInUi) {
                  if (loginSuccess) {
                    CacheHelper.saveData(
                      key: AppConstants.sharedPrefKeys.stayLoggedIn,
                      value: true,
                    );
                  }
                  stayLoggedInUi = false;
                } else {
                  CacheHelper.saveData(
                    key: AppConstants.sharedPrefKeys.stayLoggedIn,
                    value: false,
                  );
                  stayLoggedInUi = true;
                }

                setState(() {});
              }),
        ),
        Text(
          AppStrings.stayLoggedIn.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
