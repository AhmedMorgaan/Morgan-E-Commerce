import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/Services/local/hive_init.dart';
import 'package:morgan_e_commerce/core/config/routes/app_routes.dart';
import 'package:morgan_e_commerce/firebase_options.dart';

import 'core/config/theme/light_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // ...
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Easy Localization
  await EasyLocalization.ensureInitialized();

  // Initialize Hive
  await HiveInit.initializeHive();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
      saveLocale: true,
      useOnlyLangCode: true,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      path:'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Morgan E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      routerConfig: AppRoutes.goRoutes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
