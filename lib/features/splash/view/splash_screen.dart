import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/features/select_language/languages_selector_screen.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  static final route = "/splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
       context.replace(LanguageSelectorScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(SvgAssets.splashPlant),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(SvgAssets.splashLogo),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              SvgAssets.splashBottom,
            ),
          ),
        ],
      ),
    );
  }
}
