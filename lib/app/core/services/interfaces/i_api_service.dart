import 'package:brasil_cripto/app/core/enums/http_method.dart';

import '../../models/response_model.dart';

abstract class IApiService {
  Future<ResponseModel> fetch(HttpRequestMethod metodo, String? route,
      {dynamic body});
}
