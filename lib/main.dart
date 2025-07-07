import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/routes/app_routes.dart';
import 'package:morgan_e_commerce/features/splash/view/splash_screen.dart';

import 'core/config/theme/light_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morgan E-Commerce',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      initialRoute: SplashScreen.route,
      routes: AppRoutes.routes,
    );
  }
}

