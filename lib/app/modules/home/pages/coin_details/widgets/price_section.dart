import 'package:brasil_cripto/app/core/extensions/coin_tools_ext.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final Coin coin;

  const PriceSection({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final price = coin.marketData?.dataByCurrency
            .firstWhere(
              (e) => e.coinId == 'usd',
              orElse: () => MarketData('usd', currentPrice: 0.0),
            )
            .currentPrice ??
        0.0;
    final change24h = coin.marketData?.priceChangePercentage24h ?? 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preço Atual',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${price.toStringAsFixed(8)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '24h',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    coin.isPositive ? Icons.trending_up : Icons.trending_down,
                    color: coin.isPositive ? Colors.green : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${change24h.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: coin.isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
