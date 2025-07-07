import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String route = "on_boarding";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(SvgAssets.fruitBasket),
            ],
          ),
        ],
      ),
    );
  }
}
