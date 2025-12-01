import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:morgan_e_commerce/core/config/constans/app_colors.dart';


errorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.redAccent,
  );
}

warningToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    textColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
    gravity: ToastGravity.BOTTOM,
  );
}

successToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.green,
  );
}
