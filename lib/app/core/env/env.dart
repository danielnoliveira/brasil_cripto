// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'COINGECKO_API_KEY', obfuscate: true)
  static String coingeckoApiKey = _Env.coingeckoApiKey;

  @EnviedField(varName: 'COINGECKO_API_URL', obfuscate: true)
  static String coingeckoApiURL = _Env.coingeckoApiURL;
}
