import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:brasil_cripto/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.adaptativeLauncherIcon).existsSync(), isTrue);
    expect(File(Images.coingeckoAttribution).existsSync(), isTrue);
    expect(File(Images.launcherIcon).existsSync(), isTrue);
  });
}
