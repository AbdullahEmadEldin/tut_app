import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/constants/constants.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';

class StayLoggedCheckBox extends StatefulWidget {
  const StayLoggedCheckBox({
    super.key,
  });

  @override
  State<StayLoggedCheckBox> createState() => _StayLoggedCheckBoxState();
}

class _StayLoggedCheckBoxState extends State<StayLoggedCheckBox> {
  bool stayLoggedIn = false;
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
            value: stayLoggedIn,
            onChanged: (val) {
              // handling both storage value and state value
              if (stayLoggedIn) {
                CacheHelper.saveData(
                    key: AppConstants.sharedPrefKeys.stayLoggedIn,
                    value: false);
                stayLoggedIn = false;
              } else {
                CacheHelper.saveData(
                    key: AppConstants.sharedPrefKeys.stayLoggedIn, value: true);
                stayLoggedIn = true;
              }

              setState(() {});
            }),
        Text(
          AppStrings.stayLoggedIn,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
