import 'package:brasil_cripto/app/core/helpers/routes_helper.dart';
import 'package:brasil_cripto/app/core/utils/home_store_util.dart';
import 'package:brasil_cripto/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({super.key, this.title = 'SplashPage'});
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends HomeStoreStateFulWidget<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Image.asset(
                Images.adaptativeLauncherIcon,
                width: 40.w,
                fit: BoxFit.contain,
              ).animate(
                      onComplete: (controller) {
                        homeStore.initFavoriteCoins();
                        RoutesHelper.goToHome();
                      },
                      effects: [
                    MoveEffect(
                      duration: 1500.ms,
                      curve: Curves.easeOutCubic, // curva mais suave e fluida
                      begin: const Offset(0, 150),
                      end: Offset.zero,
                    ),
                    FadeEffect(
                      duration: 2500.ms,
                      curve: Curves.easeOutCubic,
                    ),
                  ])),
            ),
            Image.asset(
              Images.coingeckoAttribution,
              width: 80.w,
            ).animate(effects: [
              MoveEffect(
                duration: 1500.ms,
                curve: Curves.easeOutCubic, // curva mais suave e fluida
                begin: const Offset(0, 150),
                end: Offset.zero,
              ),
              FadeEffect(
                duration: 2500.ms,
                curve: Curves.easeOutCubic,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
