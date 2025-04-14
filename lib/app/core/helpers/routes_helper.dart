import 'package:brasil_cripto/app/core/models/coin.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RoutesHelper {
  static goToHome() {
    Modular.to.pushReplacementNamed('/home/');
  }

  static goToCoinDetails(CoinShort value) {
    Modular.to.pushNamed('/home/coin_details', arguments: value);
  }
}
