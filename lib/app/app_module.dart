import 'package:brasil_cripto/app/core/env/env.dart';
import 'package:brasil_cripto/app/core/helpers/dio_helper.dart';
import 'package:brasil_cripto/app/core/services/api_service.dart';
import 'package:brasil_cripto/app/core/services/interfaces/i_api_service.dart';
import 'package:brasil_cripto/app/features/coins/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<Dio>((i) => DioHelper.createDioInstance()),
        Bind.singleton<IApiService>(
          (i) => ApiService(
            baseUrl: 'https://api.coingecko.com/api/v3/',
            httpClient: i(),
          ),
        ),
        Bind.singleton(
          (i) => CoinsRepository(
            apiService: i(),
          ),
        ),
      ];
  @override
  List<Module> get imports => [HomeModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
