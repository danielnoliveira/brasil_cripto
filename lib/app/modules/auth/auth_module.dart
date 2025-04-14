// ignore_for_file: unnecessary_overrides

import 'package:brasil_cripto/app/modules/auth/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes =>
      [ChildRoute(Modular.initialRoute, child: (_, __) => SplashPage())];
}
