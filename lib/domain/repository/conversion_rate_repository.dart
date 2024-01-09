import 'package:flutter_exchange_currency/domain/model/conversion_rate_model.dart';

abstract interface class ConversionRateRepository {
  Future<ConversionRateModel> getConversionRate(String baseCode);
}