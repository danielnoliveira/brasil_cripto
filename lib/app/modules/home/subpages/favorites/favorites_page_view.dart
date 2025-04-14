import 'package:brasil_cripto/app/core/theme/app_colors.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/widgets/coin_card.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/widgets/list_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

import 'favorites_page_view_model.dart';

class FavoritesPageView extends FavoritesPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        top: 24,
        bottom: 4,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Criptomoedas favoritas',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 5.3.w,
                  color: AppColors.blue,
                ),
              ),
            ),
            Expanded(
              child: Observer(builder: (context) {
                if (homeStore.favoriteCoins.isEmpty) {
                  return ListWarning(
                      message: 'Nenhuma criptomoeda favoritada!');
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final coin = homeStore.favoriteCoins[index];
                    return CoinCard(
                      coin: coin,
                      isDeleteConfirmationEnabled: true,
                    );
                  },
                  itemCount: homeStore.favoriteCoins.length,
                );
              }),
            ),
          ]),
    );
  }
}
