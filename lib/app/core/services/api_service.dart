import 'dart:convert';

import 'package:brasil_cripto/app/core/enums/http_method.dart';
import 'package:brasil_cripto/app/core/models/response_model.dart';
import 'package:dio/dio.dart';

import 'interfaces/i_api_service.dart';

class ApiService extends IApiService {
  late Dio _httpClient;
  late String _baseUrl;

  set baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  set httpClient(Dio httpClient) {
    _httpClient = httpClient;
  }

  static final ApiService _apiService = ApiService._internal();

  ApiService._internal();

  factory ApiService({required String baseUrl, required Dio httpClient}) {
    _apiService._baseUrl = baseUrl;
    _apiService._httpClient = httpClient;

    return _apiService;
  }

  @override
  Future<ResponseModel> fetch(HttpRequestMethod metodo, String? route,
      {dynamic body}) async {
    final url = '$_baseUrl$route';

    try {
      final encodedBody = body != null ? json.encode(body) : null;

      final response = await switch (metodo) {
        HttpRequestMethod.GET => _httpClient.get(url, data: encodedBody),
        HttpRequestMethod.POST => _httpClient.post(url, data: encodedBody),
        HttpRequestMethod.PATCH => _httpClient.patch(url, data: encodedBody),
        HttpRequestMethod.PUT => _httpClient.put(url, data: encodedBody),
        HttpRequestMethod.DELETE => _httpClient.delete(url),
      };

      return ResponseModel.fullConstructor(
        response.statusCode,
        response.statusMessage,
        response.data,
      );
    } on DioException catch (de) {
      final data = de.response?.data;
      final status = de.response?.statusCode ?? 400;

      return ResponseModel.fullConstructor(
          status, de.response?.statusMessage ?? 'Error', data);
    } catch (e) {
      return ResponseModel.fullConstructor(400, e.toString(), null);
    }
  }
}
