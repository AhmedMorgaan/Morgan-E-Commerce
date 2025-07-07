import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/features/onboarding/view/on_boarding_screen.dart';
import 'package:morgan_e_commerce/features/splash/view/splash_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
    OnBoardingScreen.route: (context) => const OnBoardingScreen(),
  };

}
