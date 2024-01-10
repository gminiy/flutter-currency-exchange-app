import 'package:flutter_exchange_currency/core/result.dart';
import 'package:flutter_exchange_currency/domain/model/conversion_rate_model.dart';
import 'package:flutter_exchange_currency/domain/repository/conversion_rate_repository.dart';

class GetCurrencyUseCase {
  final String defaultBaseCode = 'USD';
  final ConversionRateRepository _conversionRateRepository;
  ConversionRateModel? conversionRateModel;

  GetCurrencyUseCase({
    required ConversionRateRepository conversionRateRepository,
  }) : _conversionRateRepository = conversionRateRepository;

  Future _setConversionRateModel() async {
    conversionRateModel =
        await _conversionRateRepository.getConversionRate(defaultBaseCode);
  }

  Future<Result<num>> execute(
      {required String baseCode, required String targetCode}) async {
    if (conversionRateModel == null ||
        DateTime.now().isAfter(conversionRateModel!.nextUpdateTime)) {
      await _setConversionRateModel();
    }

    final num? baseCurrency = conversionRateModel!.rates[baseCode];
    final num? targetCurrency = conversionRateModel!.rates[targetCode];

    if (baseCurrency == null || targetCurrency == null) {
      return const Result.error('not support currency');
    }

    final num currency = targetCurrency / baseCurrency;

    return Result.success(currency);
  }
}
