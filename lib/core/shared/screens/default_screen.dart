import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.scrollController,
    this.appBarTitle,
    this.titleStyle,
    this.backgroundColor,
    this.appBarColor,
    this.backArrowColor,
    this.bottomSheet,
  });

  final String? title;
  final String? subtitle;
  final Widget child;
  final ScrollController? scrollController;
  final Widget? appBarTitle;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? appBarColor;
  final Color? backArrowColor;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar: AppBar(
        backgroundColor: appBarColor ?? AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            SvgAssets.backwardArrow,
            matchTextDirection: true,
          ),
          onPressed: () => context.pop(),
        ),
        title: appBarTitle,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title == null
                    ? const SizedBox()
                    : Text(
                        title ?? "",
                        style: titleStyle ??
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                subtitle == null
                    ? const SizedBox()
                    : Text(
                        subtitle ?? "",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: AppColors.black),
                      ),
                SizedBox(child: child),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottomSheet,
    );
  }
}
