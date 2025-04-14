import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/default_theme.dart';

final navKey = GlobalKey<NavigatorState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(navKey);
    return Sizer(
      builder: (_, __, ___) {
        return MaterialApp.router(
          title: 'Cripto App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: appTheme,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
