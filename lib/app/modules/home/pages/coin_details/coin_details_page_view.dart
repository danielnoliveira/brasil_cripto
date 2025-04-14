import 'package:brasil_cripto/app/commom_widgets/builders/ds_builder.dart';
import 'package:brasil_cripto/app/core/extensions/coin_tools_ext.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/market_stats.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/no_coin_details_found.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/price_chart.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/price_section.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/project_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

import 'coin_details_page_view_model.dart';

class CoinDetailsPageView extends CoinDetailsPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              getCoinDetails();
            },
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
        title: Text(widget.coin.name),
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: AsyncDataStateBuilder(
          dataState: coinDetailsFuture,
          errorWidget: (error) {
            return NoCoinDetailsFound(
              reloadFn: getCoinDetails,
            );
          },
          dataWidget: (coin) {
            final historicalPrices =
                coin.marketData?.sparkline7d?.price ?? <double>[];
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PriceSection(coin: coin),
                  if (historicalPrices.isNotEmpty)
                    PriceChart(
                      historicalPrices: historicalPrices,
                    ),
                  MarketStats(coin: coin),
                  ProjectDescription(coin: coin),
                ],
              ),
            );
          },
          invalidWidget: () {
            return NoCoinDetailsFound(
              reloadFn: getCoinDetails,
            );
          },
        ),
      ),
    );
  }
}
