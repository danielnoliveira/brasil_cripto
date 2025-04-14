import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:brasil_cripto/app/modules/home/pages/coin_details/coin_details_page.dart';
import 'package:brasil_cripto/app/modules/home/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HomeStore>(
          (i) => HomeStore(),
          export: true,
          onDispose: (store) {
            if (store.favoriteCoinsDisposer != null) {
              store.favoriteCoinsDisposer!();
            }
          },
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => HomePage(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/coin_details',
          child: (_, args) => CoinDetailsPage(
            coin: args.data as CoinShort,
          ),
          transition: TransitionType.rightToLeftWithFade,
        )
      ];
}
