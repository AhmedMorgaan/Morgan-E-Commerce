import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/generated/locale_keys.g.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? postFixIcon;
  final double? width;
  final double? index;
  final Widget? prefixIcon;
  final FocusNode? focus;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? nextFocus;
  final Color? color;
  final void Function(String)? onSubmit;
  final String? title;
  final bool protected;
  final TextInputAction? textInputAction;
  final Color? shadow;
  final String? hint;
  final bool? required;
  final bool? enable;
  final String? prefixText;
  final void Function(String)? onChanged;
  final String? placeholder;
  final bool readOnly;
  final bool showCounter;
  final VoidCallback? onTap;

  const InputFieldWidget({
    super.key,
    required this.controller,
    this.postFixIcon,
    this.width,
    this.index,
    this.prefixIcon,
    this.focus,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.keyboardType,
    this.nextFocus,
    this.color,
    this.onSubmit,
    this.title,
    this.protected = false,
    this.textInputAction,
    this.shadow,
    this.hint,
    this.required = false,
    this.enable = true,
    this.prefixText = '',
    this.onChanged,
    this.placeholder = "",
    this.readOnly = false,
    this.showCounter = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryColor,
          onPrimary: AppColors.primaryColor,
          secondary: Colors.grey.shade200,
          onSecondary: Colors.grey.shade200,
          error: AppColors.red,
          onError: AppColors.red,
          surface: Colors.white,
          onSurface: AppColors.black,
          surfaceTint: Colors.white,
        ),
      ),
      child: Container(
        decoration: shadow != null
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                  ),
                ],
              )
            : null,
        margin: color == null ? const EdgeInsets.only(bottom: 15) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AutoSizeText(
                  "$title",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                ),
              ),
            TextFormField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              buildCounter: (
                context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) =>
                  showCounter
                      ? Container(
                          transform: Matrix4.translationValues(0, -30, 0),
                          child: Text(
                            "$currentLength/$maxLength",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.warmGrey),
                          ),
                        )
                      : null,
              maxLines: maxLines ?? 1,
              maxLength: maxLength,
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: enable,
              readOnly: readOnly,
              focusNode: focus,
              obscureText: protected,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                if (required == true) {
                  if (value!.isEmpty) {
                    return LocaleKeys.required_field.tr();
                  }
                  if (validator != null) return validator!(value);
                }
                return null;
              },
              onTap: onTap ??
                  () {
                    focus?.requestFocus();
                  },
              onFieldSubmitted: (value) {
                focus?.unfocus();
                if (nextFocus != null) {
                  FocusScope.of(context).requestFocus(nextFocus);
                }
                if (onSubmit != null) onSubmit!(value);
              },
              onChanged: onChanged,
              decoration: InputDecoration(

                contentPadding: const EdgeInsets.all(16),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayScale),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayScale),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                errorStyle: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
                filled: true,
                hintText: placeholder,
                prefixIcon: prefixIcon,
                prefixIconColor: AppColors.primaryColor,
                suffixIconColor: AppColors.primaryColor,
                hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.warmGrey,
                ),
                suffixIcon: postFixIcon,
                fillColor: color ?? const Color(0xffF0F0F0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
