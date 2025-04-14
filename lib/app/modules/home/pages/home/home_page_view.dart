import 'package:brasil_cripto/app/core/enums/bottom_nav_page_type.dart';
import 'package:brasil_cripto/app/modules/home/pages/home/home_page_view_model.dart';
import 'package:brasil_cripto/app/modules/home/pages/home/widgets/bottom_navigation_bar.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/dashboard_page.dart';
import 'package:brasil_cripto/app/modules/home/subpages/favorites/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Observer(builder: (context) {
          return SafeArea(child: () {
            switch (homeStore.bottomNavPageType) {
              case BottomNavPageType.dashboard:
                return DashboardPage();
              case BottomNavPageType.favorite:
                return FavoritesPage();
            }
          }());
        }),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
