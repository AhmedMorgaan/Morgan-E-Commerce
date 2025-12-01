import 'package:flutter/material.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final bool isRequired;
  final ValueChanged <bool> onChanged;
   const CustomCheckbox({super.key, required this.isChecked, required this.onChanged, required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
         onChanged(!isChecked);
       },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : AppColors.white ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1.5,
              color: isRequired ? AppColors.red : isChecked ? AppColors.transparent : AppColors.grayScale
            )
          ),
        ),
        child: Icon(
          Icons.check,
          size: 16,
          color: isChecked ? AppColors.white :AppColors.transparent,
        ),
      ),
    );
  }
}
