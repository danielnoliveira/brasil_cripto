import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:brasil_cripto/app/core/services/interfaces/i_api_service.dart';
import 'package:result_dart/result_dart.dart';

abstract class ICoinsRepository {
  IApiService apiService;
  ICoinsRepository({
    required this.apiService,
  });

  Future<Result<List<CoinShort>>> search(String value);
  Future<Result<Coin>> getCoinDataById(String coinId);
}
