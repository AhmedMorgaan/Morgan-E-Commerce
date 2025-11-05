import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morgan_e_commerce/Services/local/config_local_datasource.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/core/shared/components/default_button.dart';
import 'package:morgan_e_commerce/core/utils/debug_prints.dart';
import 'package:morgan_e_commerce/features/onboarding/view/on_boarding_screen.dart';
import 'package:morgan_e_commerce/features/select_language/model/langunage_item_model.dart';
import 'package:morgan_e_commerce/generated/locale_keys.g.dart';

import 'view/components/langauge_item.dart';

class LanguageSelectorScreen extends StatefulWidget {
  static const String route = "/language_selector_screen";

  const LanguageSelectorScreen({super.key});

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  int selectedLang = 0;
  Locale selectedLocalLang = const Locale("en", "US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 6.0),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text(
                LocaleKeys.choose_your_language.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedLang = index;
                        selectedLocalLang = languageList[index].langLocale!;
                        context.setLocale(selectedLocalLang);
                        ConfigLocalDatasource.setLanguageCode(
                          selectedLocalLang.languageCode,
                        );
                      });
                    },
                    child: LanguageItem(
                      model: languageList[index],
                      select: ConfigLocalDatasource.getLanguageCode() ==
                              languageList[index].langLocale?.languageCode
                          ? true
                          : false,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: DefaultButton(
                    title: LocaleKeys.select.tr(),
                    onTap: () async {
                      printDone("Locale $selectedLocalLang");
                      printDone("Locale ${selectedLocalLang.languageCode}");
                      context.go(OnBoardingScreen.route);
                      // context.setLocale(selectedLocalLang).then((value) async {
                      //   await ConfigLocalDatasource.setLanguageCode(
                      //     selectedLocalLang.languageCode,
                      //   );
                      // }).whenComplete(() {
                      //   // if (AuthLocalDataSource.getJwtToken().isNotEmpty) {
                      //   //   WidgetRebirth.createRebirth(context: context);
                      //   //   context.pop();
                      //   // } else {
                      //   //   context.go(OnboardingScreen.routeName);
                      //   // }
                      //   context.go(OnBoardingScreen.route);
                      // });
                    },
                  ),
                ),
                //   style: primaryButtonStyle(border: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<LanguageItemModel> languageList = <LanguageItemModel>[
  LanguageItemModel(
    iconPath: "",
    name: LocaleKeys.english.tr(),
    langLocale: const Locale("en", "US"),
    viewFlag: false,
  ),
  LanguageItemModel(
    iconPath: "",
    name: LocaleKeys.arabic.tr(),
    langLocale: const Locale("ar", "EG"),
    viewFlag: false,
  ),
];
