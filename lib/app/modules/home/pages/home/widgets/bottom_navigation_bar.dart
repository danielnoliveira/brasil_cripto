import 'package:brasil_cripto/app/core/enums/bottom_nav_page_type.dart';
import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:brasil_cripto/app/core/utils/home_store_util.dart';
import 'package:brasil_cripto/app/modules/home/pages/home/widgets/bottom_navigation_bar_item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState
    extends HomeStoreStateFulWidget<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SafeArea(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: homeStore.bottomNavPageType.index,
          onTap: (index) {
            var pageType = BottomNavPageType.values[index];

            homeStore.setBottomNavPageType(pageType);
          },
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 3.75.w,
            color: AppColors.blue,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 3.75.w,
            color: AppColors.mutedAzure,
          ),
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.mutedAzure,
          items: BottomNavPageType.values.map(
            (e) {
              bool isActive = e == homeStore.bottomNavPageType;
              return BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: BottomNavigationBarItemImage(
                    icon: isActive ? e.icon : e.unselectedIcon,
                    active: isActive,
                  ),
                  label: e.name);
            },
          ).toList(),
        ),
      );
    });
  }
}
