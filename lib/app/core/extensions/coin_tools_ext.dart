import 'package:coingecko_api/data/coin.dart';

extension CoinToolsExt on Coin {
  bool get isPositive => (marketData?.priceChangePercentage24h ?? 0.0) > 0;
}
