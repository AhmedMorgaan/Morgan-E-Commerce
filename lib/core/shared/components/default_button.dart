import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final double? titleSize;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final bool loading;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? loaderColor;
  final Color? titleColor;
  final Color? borderColor;
  final Widget? prefix;
  final Widget? postfix;
  final Color? shadowColor;

  const DefaultButton({
    super.key,
    required this.title,
    required this.onTap,
    this.margin,
    this.width,
    this.borderRadius,
    this.height,
    this.backgroundColor,
    this.loading = false,
    this.titleColor,
    this.borderColor,
    this.prefix,
    this.postfix,
    this.shadowColor,
    this.loaderColor,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? 200,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 12),
          ),
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix ?? Container(),
            loading == true
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          loaderColor ?? Colors.white,
                        ),
                      ),
                    ),
                  )
                : Text(
                    title.toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize:titleSize ?? 14,
                      fontWeight: FontWeight.w700,
                      color: titleColor ?? Colors.white,
                    ),
                  ),
            postfix ?? Container(),
          ],
        ),
      ),
    );
  }
}
