import 'package:dio/dio.dart';
import 'package:flutter_exchange_currency/core/result.dart';
import 'package:flutter_exchange_currency/data/data_source/remote/conversion_rate_api.dart';
import 'package:flutter_exchange_currency/data/repository/conversion_rate_repository_impl.dart';
import 'package:flutter_exchange_currency/domain/use_case/get_currency_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getCurrencyUseCase test', () async {
    final ConversionRateApi api = ConversionRateApi(dio: Dio());
    final repository = ConversionRateRepositoryImpl(api: api);
    final GetCurrencyUseCase getCurrencyUseCase = GetCurrencyUseCase(
        conversionRateRepository: repository);
    final Result<num> result = await getCurrencyUseCase.execute(baseCode: 'USD', targetCode: 'KRW');
    switch (result) {
      case Success<num>():
        expect(result.data.runtimeType, double);
      case Error<num>():
        // TODO: Handle this case.
    }
  });
}
