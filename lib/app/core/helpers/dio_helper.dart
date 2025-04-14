import 'package:brasil_cripto/app/core/env/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? _instance;
  //method for getting dio instance
  static Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  static Dio createDioInstance() {
    var dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods":
              "GET, POST, PATCH, PUT, DELETE, OPTIONS",
          "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token",
          "x-cg-demo-api-key": Env.coingeckoApiKey,
        },
      ),
    );
    dio.interceptors.addAll([
      if (!kReleaseMode)
        PrettyDioLogger(
          responseBody: false,
          requestHeader: true,
          requestBody: false,
          compact: true,
          request: true,
        ),
    ]);

    return dio;
  }
}
