import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/features/onboarding/view/on_boarding_screen.dart';
import 'package:morgan_e_commerce/features/select_language/languages_selector_screen.dart';
import 'package:morgan_e_commerce/features/splash/view/splash_screen.dart';
import 'package:morgan_e_commerce/main.dart';

class AppRoutes {
  static final GoRouter goRoutes = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: SplashScreen.route,
      observers: [],
      routes: [
        GoRoute(
            path: SplashScreen.route,
            builder:(context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: OnBoardingScreen.route,
          builder:(context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: LanguageSelectorScreen.route,
          builder:(context, state) => const LanguageSelectorScreen(),
        ),
      ]
  );
}
