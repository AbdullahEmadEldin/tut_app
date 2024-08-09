import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/core/router/app_router.dart';
import 'package:tut_app/core/theme/theme_manager.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/modules/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (_) => MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// Making the MyApp a singleton to ensure that there is only one entry point of the application through it's life cycle.
  /// and to enable use it in di or state management.
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerate,
      initialRoute: SplashScreen.routeName,
      theme: AppThemes.lightAppTheme(context),
    );
  }
}
