import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:morgan_e_commerce/resources/resources.dart';

void main() {
  test('svg_assets assets test', () {
    expect(File(SvgAssets.fruitBasket).existsSync(), isTrue);
    expect(File(SvgAssets.splashBottom).existsSync(), isTrue);
    expect(File(SvgAssets.splashLogo).existsSync(), isTrue);
    expect(File(SvgAssets.splashPlant).existsSync(), isTrue);
  });
}
