import 'package:hive_flutter/hive_flutter.dart';
import 'package:morgan_e_commerce/core/config/constans/local_boxes.dart';

class HiveInit {
  static Future<void> initializeHive() async {
    // Add your Hive initialization code here
    await Hive.initFlutter();
    await Hive.openBox(LocalDataSourceBoxes.configBox);
  }
}