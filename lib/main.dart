import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/core/router/app_router.dart';
import 'package:tut_app/core/theme/theme_manager.dart';
import 'package:tut_app/core/services/cache/cache_helper.dart';
import 'package:tut_app/modules/splash/splash_screen.dart';

void main() async {
  // Set the status bar to transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Set icon brightness (optional)
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  final String startLocale = await LanguageManager.getAppLang();
  CacheHelper.init();
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (_) => MyApp()));
  runApp(
    EasyLocalization(
      startLocale: Locale(startLocale),
      supportedLocales: [
        Locale(
          LanguageType.english.code,
        ),
        Locale(
          LanguageType.arabic.code,
        )
      ],
      path: AppAssets.translationsPath,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  /// Making the MyApp a singleton to ensure that there is only one entry point of the application through it's life cycle.
  /// and to enable use it in di or state management.
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('Initial Theme ===>>> ${AppThemes.instance.themeNotifier.value}');
    return ValueListenableBuilder<ThemeMode?>(
        valueListenable: AppThemes.instance.themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerate,
            initialRoute: SplashScreen.routeName,
            themeMode: themeMode,
            theme: AppThemes.instance.lightAppTheme(context),
            darkTheme: AppThemes.instance.darkAppTheme(context),
          );
        });
  }
}
