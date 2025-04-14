import 'package:brasil_cripto/app/modules/home/pages/coin_details/widgets/stat_item.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:flutter/material.dart';

class MarketStats extends StatelessWidget {
  final Coin coin;
  const MarketStats({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final currentMarketData = coin.marketData?.dataByCurrency.firstWhere(
      (e) => e.coinId == 'usd',
      orElse: () => MarketData('usd', marketCap: null),
    );
    final marketCap = currentMarketData?.marketCap;
    final totalVolume = currentMarketData?.totalVolume;
    final high24h = currentMarketData?.high24h;
    final low24h = currentMarketData?.low24h;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Estatísticas de Mercado',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            StatItem(
              label: 'Capitalização de Mercado',
              value: '\$${marketCap?.toStringAsFixed(0) ?? 'N/A'}',
            ),
            StatItem(
              label: 'Volume 24h',
              value: '\$${totalVolume?.toStringAsFixed(0) ?? 'N/A'}',
            ),
            StatItem(
              label: 'Máxima 24h',
              value: '\$${high24h?.toStringAsFixed(2) ?? 'N/A'}',
            ),
            StatItem(
              label: 'Mínima 24h',
              value: '\$${low24h?.toStringAsFixed(2) ?? 'N/A'}',
            ),
          ],
        ),
      ],
    );
  }
}
