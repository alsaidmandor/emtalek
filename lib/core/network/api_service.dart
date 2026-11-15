import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({
    required String endPoint,
    String? userToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(
      headers: userToken != null ? {'Authorization': 'Bearer $userToken'} : null,
    );
    return await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    String? userToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(
      headers: userToken != null ? {'Authorization': 'Bearer $userToken'} : null,
    );
    return await _dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
