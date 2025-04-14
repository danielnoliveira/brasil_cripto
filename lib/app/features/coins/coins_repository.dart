import 'package:brasil_cripto/app/core/enums/http_method.dart';
import 'package:brasil_cripto/app/core/helpers/function_helper.dart';
import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:brasil_cripto/app/features/coins/i_coins_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:coingecko_api/data/coin.dart';

class CoinsRepository extends ICoinsRepository {
  CoinsRepository({required super.apiService});

  @override
  Future<Result<List<CoinShort>>> search(String value) {
    return FunctionHelper.handleApiRequest(
      apiService: apiService,
      method: HttpRequestMethod.GET,
      route: 'search?query=$value',
      successReturn: (result) {
        try {
          return (result.content['coins'] as List)
              .map((e) => CoinShort.fromJson(e))
              .toList();
        } catch (e) {
          return <CoinShort>[];
        }
      },
    );
  }

  @override
  Future<Result<Coin>> getCoinDataById(String coinId) async {
    return FunctionHelper.handleApiRequest(
      apiService: apiService,
      method: HttpRequestMethod.GET,
      route:
          'coins/$coinId?tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=true',
      successReturn: (result) {
        return Coin.fromJson(result.content);
      },
    );
  }
}
