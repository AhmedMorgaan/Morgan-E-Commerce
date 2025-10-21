import 'package:flutter/material.dart';

class OnBoardingItemModel {
  final InlineSpan title; // Can be TextSpan or Text.rich
  final String description;
  final String image;
  final String bgImage;

  const OnBoardingItemModel({
    required this.title,
    required this.description,
    required this.image,
    required this.bgImage,
  });
}
