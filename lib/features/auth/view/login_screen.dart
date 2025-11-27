import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/core/shared/components/default_button.dart';
import 'package:morgan_e_commerce/core/shared/components/default_input_field.dart';
import 'package:morgan_e_commerce/core/shared/screens/default_screen.dart';
import 'package:morgan_e_commerce/core/utils/debug_prints.dart';
import 'package:morgan_e_commerce/core/utils/validators.dart';
import 'package:morgan_e_commerce/generated/locale_keys.g.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = "/loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isProtected = true;

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      appBarTitle: Text(LocaleKeys.login.tr()),
      withBackButton: false,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            InputFieldWidget(
              controller: _emailController,
              validator: (value) {
                if (!Validators.isValidEmail(value!)) {
                  return LocaleKeys.email_valid_msg.tr();
                }
                return null;
              },
              color: AppColors.semiGray,
              required: true,
              maxLines: 1,
              keyboardType: TextInputType.text,
              placeholder: LocaleKeys.email_field_hint.tr(),
            ),
            const SizedBox(height: 15),
            InputFieldWidget(
              controller: _passwordController,
              validator: (value) {
                if (value!.length < 5) {
                  return LocaleKeys.password_valid_msg.tr();
                }
                return null;
              },
              color: AppColors.semiGray,
              required: true,
              maxLines: 1,
              keyboardType: TextInputType.text,
              placeholder: LocaleKeys.password_field_hint.tr(),
              protected: isProtected,
              postFixIcon: IconButton(
                icon: Icon(
                  isProtected ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.warmGrey,
                ),
                onPressed: () {
                  setState(() {
                    isProtected = !isProtected;
                  });
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.semiGreen),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            DefaultButton(
              title: LocaleKeys.login.tr(),
              titleSize: 16,
              width: double.infinity,
              borderRadius: 16,
              onTap: () {},
            ),
            SizedBox(
              height: 30,
            ),
            Text.rich(
                TextSpan(children: [
              TextSpan(
                  text: LocaleKeys.donot_have_acc.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.warmGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              TextSpan(
                  text: LocaleKeys.create_one.tr(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      printWarning("ssssssssssssssssssssss");
                    },
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16))
            ])),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.grayScale,
                    thickness: 1.5,
                    endIndent: 10,
                  ),
                ),
                Text(
                  LocaleKeys.or.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.grayScale,
                    thickness: 1.5,
                    indent: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            DefaultButton(
              title: LocaleKeys.login_with_google.tr(),
              borderColor: AppColors.grayScale,
              backgroundColor: AppColors.white,
              titleColor: AppColors.black,
              titleSize: 16,
              width: double.infinity,
              borderRadius: 16,
              onTap: () {},
              prefix: SvgPicture.asset(
                SvgAssets.googleIcon,
                width: 24,
                height: 24,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DefaultButton(
              title: LocaleKeys.login_with_apple.tr(),
              borderColor: AppColors.grayScale,
              backgroundColor: AppColors.white,
              titleColor: AppColors.black,
              titleSize: 16,
              width: double.infinity,
              borderRadius: 16,
              onTap: () {},
              prefix: SvgPicture.asset(
                SvgAssets.appleIcon,
                width: 24,
                height: 24,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DefaultButton(
              title: LocaleKeys.login_with_fb.tr(),
              borderColor: AppColors.grayScale,
              backgroundColor: AppColors.white,
              titleColor: AppColors.black,
              titleSize: 16,
              width: double.infinity,
              borderRadius: 16,
              onTap: () {},
              prefix: SvgPicture.asset(
                SvgAssets.fbIcon,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
