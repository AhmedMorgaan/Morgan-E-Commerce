import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/features/auth/view/login_screen.dart';
import 'package:morgan_e_commerce/features/auth/view/register_screen.dart';
import 'package:morgan_e_commerce/features/home/view/home_screen.dart';
import 'package:morgan_e_commerce/features/onboarding/view/on_boarding_screen.dart';
import 'package:morgan_e_commerce/features/select_language/languages_selector_screen.dart';
import 'package:morgan_e_commerce/features/splash/view/splash_screen.dart';
import 'package:morgan_e_commerce/main.dart';

class AppRoutes {
  static final GoRouter goRoutes = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: SplashScreen.routeName,
      observers: [],
      routes: [
        GoRoute(
          path: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: OnBoardingScreen.routeName,
          builder: (context, state) => const OnBoardingScreen(),
        ),
        GoRoute(
          path: LanguageSelectorScreen.routeName,
          builder: (context, state) => const LanguageSelectorScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeName,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: RegisterScreen.routeName,
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          builder: (context, state) => HomeScreen(),
        ),
      ]);
}
