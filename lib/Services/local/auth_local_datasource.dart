import 'package:hive_flutter/hive_flutter.dart';
import 'package:morgan_e_commerce/core/config/constans/local_boxes.dart';

class AuthLocalDataSource {
  static Future<void> setUserData(Map<String, dynamic> userData) async {
    await Hive.box(LocalDataSourceBoxes.authBox)
        .put(LocalDataSourceKeys.userData, userData);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    return Hive.box(LocalDataSourceBoxes.authBox)
        .get(LocalDataSourceKeys.userData, defaultValue: {});
  }
}
