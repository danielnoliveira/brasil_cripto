import 'package:brasil_cripto/app/core/async_state/async_data_state.dart';
import 'package:brasil_cripto/app/core/mixins/automatic_search_mixin.dart';
import 'package:brasil_cripto/app/core/utils/home_store_util.dart';
import 'package:brasil_cripto/app/features/coins/coins_repository.dart';
import 'package:brasil_cripto/app/modules/home/subpages/dashboard/dashboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class DashboardPageViewModel
    extends HomeStoreStateFulWidget<DashboardPage> with AutomaticSearchMixin {
  final coinsRepository = Modular.get<CoinsRepository>();

  @override
  void initState() {
    super.initState();
    automaticSearchRefreshCallback = () {
      searchCoinsByQuery();
    };
  }

  void searchCoinsByQuery() async {
    homeStore.coinsAsyncState = LoadingState();

    try {
      final result =
          await coinsRepository.search(homeStore.searchController.text);
      if (result.isSuccess()) {
        homeStore.coinsAsyncState = FetchedState(result.getOrThrow());
      } else {
        homeStore.coinsAsyncState = FailedState(result.exceptionOrNull()!);
      }
    } catch (e) {
      homeStore.coinsAsyncState =
          FailedState(e is Exception ? e : Exception('Unknown error'));
    }
  }
}
