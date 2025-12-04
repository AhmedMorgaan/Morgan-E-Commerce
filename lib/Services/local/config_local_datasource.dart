import 'package:hive_flutter/hive_flutter.dart';
import 'package:morgan_e_commerce/core/config/constans/local_boxes.dart';

class ConfigLocalDatasource {
  static Future<void> setLanguageCode(String langCode) async {
    await Hive.box(LocalDataSourceBoxes.configBox)
        .put(LocalDataSourceKeys.langCode, langCode);
  }

  static String getLanguageCode() {
    return Hive.box(LocalDataSourceBoxes.configBox)
        .get(LocalDataSourceKeys.langCode, defaultValue: "en");
  }

  static Future<void> setIsFirstOpen(bool isFirstOpen) async {
    await Hive.box(LocalDataSourceBoxes.configBox)
        .put(LocalDataSourceKeys.isFirstOpen, isFirstOpen);
  }

  static bool getIsFirstOpen() {
    return Hive.box(LocalDataSourceBoxes.configBox)
        .get(LocalDataSourceKeys.isFirstOpen, defaultValue: true);
  }
}
