import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/core/helper/toast_messages.dart';
import 'package:morgan_e_commerce/core/shared/components/default_button.dart';
import 'package:morgan_e_commerce/core/shared/components/default_input_field.dart';
import 'package:morgan_e_commerce/core/shared/screens/default_screen.dart';
import 'package:morgan_e_commerce/core/utils/base_state.dart';
import 'package:morgan_e_commerce/core/utils/debug_prints.dart';
import 'package:morgan_e_commerce/core/utils/validators.dart';
import 'package:morgan_e_commerce/features/auth/cubit/register_cubit.dart';
import 'package:morgan_e_commerce/features/auth/model/register_model.dart';
import 'package:morgan_e_commerce/features/auth/view/components/custom_checkbox.dart';
import 'package:morgan_e_commerce/generated/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/registerScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isProtected = true;
  bool isChecked = false;
  bool isRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: DefaultScreen(
          appBarTitle: Text(LocaleKeys.register_title.tr()),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputFieldWidget(
                  controller: _userNameController,
                  validator: (value) {
                    if (!Validators.isValidName(value!)) {
                      return LocaleKeys.name_valid_msg.tr();
                    }
                    return null;
                  },
                  color: AppColors.semiGray,
                  required: true,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  placeholder: LocaleKeys.full_name.tr(),
                ),
                SizedBox(
                  height: 15,
                ),
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
                SizedBox(
                  height: 15,
                ),
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
                  height: 15,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      isChecked: isChecked,
                      isRequired: isRequired,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                          isRequired = isChecked ? false : true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: LocaleKeys.agree_terms_conditions_des.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: AppColors.warmGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                        TextSpan(
                            text: LocaleKeys.agree_terms_conditions.tr(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                printWarning("ssssssssssssssssssssss");
                              },
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: AppColors.semiGreen,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))
                      ])),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                BlocConsumer<RegisterCubit, BaseState>(
                  listener: (context, state) {
                    if (state is BaseError) {
                      errorToast(state.message);
                    }
                    if (state is BaseLoaded) {
                      successToast("Registered Successfully");
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return DefaultButton(
                      loading: state is BaseLoading,
                      width: double.infinity,
                      title: LocaleKeys.create_new_acc.tr(),
                      onTap: () {
                        if (!isChecked) {
                          setState(() {
                            isRequired = true;
                          });
                          warningToast("Please agree to terms and conditions");
                          return;
                        } else {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<RegisterCubit>()
                                .registerUserWithEmailAndPassword(RegisterModel(
                                  name: _userNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          }
                        }
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: LocaleKeys.already_have_acc.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.warmGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                  TextSpan(
                      text: LocaleKeys.log_in.tr(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pop();
                        },
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16))
                ]))
              ],
            ),
          )),
    );
  }
}
