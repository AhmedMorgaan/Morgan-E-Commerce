import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/features/onboarding/model/on_boarding_item_model.dart';

class OnBoardingPageItem extends StatelessWidget {
  final OnBoardingItemModel itemModel;
  final int currentIndex;

  const OnBoardingPageItem({super.key, required this.itemModel, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(children: [
            Positioned.fill(
              child: SvgPicture.asset(
                itemModel.bgImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: SvgPicture.asset(
                itemModel.image,
              ),
            ),
            Visibility(
              visible: currentIndex == 0,
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Skip"),
                ),
              ),
            ),
          ]),
        ),
        Column(
          children: [
            SizedBox(height: 65),
            RichText(
              textAlign: TextAlign.center,
              text: itemModel.title,
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                itemModel.description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 13,
                height: 1.7,
                color: AppColors.grayScale),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
