import 'package:brasil_cripto/app/core/async_state/async_data_state.dart';
import 'package:brasil_cripto/app/features/coins/coins_repository.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/coin_details_page.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class CoinDetailsPageViewModel extends State<CoinDetailsPage> {
  CoinsRepository coinsRepository = Modular.get<CoinsRepository>();
  AsyncDataState<Coin> coinDetailsFuture = LoadingState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getCoinDetails();
      },
    );
  }

  void getCoinDetails() async {
    if (mounted) {
      setState(() {
        coinDetailsFuture = LoadingState();
      });
    }

    try {
      final result = await coinsRepository.getCoinDataById(widget.coin.id);
      if (result.isSuccess()) {
        if (mounted) {
          setState(() {
            coinDetailsFuture = FetchedState(result.getOrThrow());
          });
        }
      } else {
        if (mounted) {
          setState(() {
            coinDetailsFuture = FailedState(result.exceptionOrNull()!);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          coinDetailsFuture =
              FailedState(e is Exception ? e : Exception('Unknown error'));
        });
      }
    }
  }
}
