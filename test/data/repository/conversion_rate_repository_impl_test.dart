import 'package:dio/dio.dart';
import 'package:flutter_exchange_currency/data/data_source/remote/conversion_rate_api.dart';
import 'package:flutter_exchange_currency/data/repository/conversion_rate_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

void main() {
  test('ConversionRateRepository Test', () async {
    final ConversionRateApi api = ConversionRateApi(dio: Dio());
    final repository = ConversionRateRepositoryImpl(api: api);
    final model = await repository.getConversionRate('USD');

    expect(model.lastUpdateTime.runtimeType, DateTime);
    expect(model.nextUpdateTime.runtimeType, DateTime);
    expect(model.rates.runtimeType, EqualUnmodifiableMapView<String, num>);
  });
}
