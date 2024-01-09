import 'package:dio/dio.dart';

class ConversionRateApi {
  final String _baseUrl = 'https://v6.exchangerate-api.com';

  final Dio _dio;

  const ConversionRateApi({
    required Dio dio,
  }) : _dio = dio;

  Future<Map<String, dynamic>> getConversionRate(String baseCode) async {
    final String uri = '$_baseUrl/v6/acfe21c07bf14765b0ce1f17/latest/$baseCode';
    final response = await _dio.get(uri);
    return response.data as Map<String, dynamic>;
  }
}
