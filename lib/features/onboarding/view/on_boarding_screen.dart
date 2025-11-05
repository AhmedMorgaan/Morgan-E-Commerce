import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/core/shared/components/default_button.dart';
import 'package:morgan_e_commerce/features/onboarding/model/on_boarding_item_model.dart';
import 'package:morgan_e_commerce/features/onboarding/view/widget/on_boarding_page_item.dart';
import 'package:morgan_e_commerce/generated/locale_keys.g.dart';
import 'package:morgan_e_commerce/resources/resources.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String route = "/onBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingItemModel> onboardingData = [
    OnBoardingItemModel(
      title: TextSpan(
        children: [
          TextSpan(
            text: LocaleKeys.welcome_to.tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const TextSpan(
            text: "Fruit",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const TextSpan(
            text: "Hub",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
      description:LocaleKeys.on_boarding_dec_1.tr(),
      image: SvgAssets.onBoardingImage1,
      bgImage: SvgAssets.onBoardingBackgroundImage1,
    ),
    OnBoardingItemModel(
      title: TextSpan(
        text: LocaleKeys.on_boarding_item_title_2.tr(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      description:LocaleKeys.on_boarding_dec_2.tr(),
      image: SvgAssets.onBoardingImage2,
      bgImage: SvgAssets.onBoardingBackgroundImage2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return OnBoardingPageItem(
                      itemModel: data, currentIndex: index);
                },
              ),
            ),
            DotsIndicator(
              dotsCount: onboardingData.length,
              position: _currentPage.toDouble(),
              decorator: DotsDecorator(
                activeColor: AppColors.primaryColor,
                color: AppColors.primaryColor.withValues(alpha: .5),
                size: const Size.square(8.0),
                activeSize: const Size(18.0, 8.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 40),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _currentPage != 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultButton(
                  height: 60,
                  width: double.infinity,
                  title: LocaleKeys.on_boarding_button_title.tr(),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
