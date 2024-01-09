import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_exchange_currency/data/data_source/remote/conversion_rate_api.dart';
import 'package:flutter_exchange_currency/data/repository/conversion_rate_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ConversionRateRepository Test', () {
    final ConversionRateApi api = ConversionRateApi(dio: Dio());
    final repository = ConversionRateRepositoryImpl(api: api);

  });
}