import 'package:equatable/equatable.dart';

class CoinShort extends Equatable {
  final String id;
  final String name;
  final String apiSymbol;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String large;

  const CoinShort({
    required this.id,
    required this.name,
    required this.apiSymbol,
    required this.symbol,
    required this.marketCapRank,
    required this.thumb,
    required this.large,
  });

  factory CoinShort.fromJson(Map<String, dynamic> json) {
    return CoinShort(
      id: json['id'] as String,
      name: json['name'] as String,
      apiSymbol: json['api_symbol'] as String,
      symbol: json['symbol'] as String,
      marketCapRank: json['market_cap_rank'] as int,
      thumb: json['thumb'] as String,
      large: json['large'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'api_symbol': apiSymbol,
      'symbol': symbol,
      'market_cap_rank': marketCapRank,
      'thumb': thumb,
      'large': large,
    };
  }

  @override
  List<Object?> get props => [id];
}
