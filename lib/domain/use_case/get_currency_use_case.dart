import 'package:flutter_exchange_currency/core/result.dart';
import 'package:flutter_exchange_currency/domain/model/conversion_rate_model.dart';
import 'package:flutter_exchange_currency/domain/repository/conversion_rate_repository.dart';

class GetCurrencyUseCase {
  final String defaultBaseCode = 'USD';
  final String _baseCode;
  final String _targetCode;
  final ConversionRateRepository _conversionRateRepository;

  const GetCurrencyUseCase({
    required String baseCode,
    required String targetCode,
    required ConversionRateRepository conversionRateRepository,
  })  : _baseCode = baseCode,
        _targetCode = targetCode,
        _conversionRateRepository = conversionRateRepository;

  Future<Result<num>> execute() async {
    final ConversionRateModel conversionRateModel =
        await _conversionRateRepository.getConversionRate(defaultBaseCode);
    final num? baseCurrency = conversionRateModel.rates[_baseCode];
    final num? targetCurrency = conversionRateModel.rates[_targetCode];

    if (baseCurrency == null || targetCurrency == null) {
      return const Result.error('not support currency');
    }

    final num currency = targetCurrency / baseCurrency;

    return Result.success(currency);
  }
}
