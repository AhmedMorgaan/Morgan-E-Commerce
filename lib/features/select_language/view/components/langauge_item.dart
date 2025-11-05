import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';
import 'package:morgan_e_commerce/features/select_language/model/langunage_item_model.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

class LanguageItem extends StatelessWidget {
  LanguageItemModel model;
  bool? select;

  LanguageItem({
    required this.model,
    required this.select,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: model.viewFlag!
          ? BoxDecoration(
              border: Border.all(
                width: 1,
                color: select! ? AppColors.primaryColor : AppColors.gray,
              ),
              borderRadius: BorderRadius.circular(8),
            )
          : const BoxDecoration(),
      child: Row(
        children: [
          if (model.viewFlag!)
            SvgPicture.asset(
              model.iconPath!,
            ),
          SizedBox(
            width: model.viewFlag! ? 20 : 0,
          ),
          Text(
            model.name!,
          ),
          const Spacer(),
          if (select!)
            SvgPicture.asset(
              SvgAssets.selectedLang,
            ),
        ],
      ),
    );
  }
}
