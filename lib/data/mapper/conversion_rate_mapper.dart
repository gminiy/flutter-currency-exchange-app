import 'package:flutter_exchange_currency/data/dto/conversion_rate_dto.dart';
import 'package:flutter_exchange_currency/domain/model/conversion_rate_model.dart';

extension ConversionRateMapper on ConversionRateDTO {
  ConversionRateModel toConversionRateModel() {
    return ConversionRateModel(
        rates: conversionRates ?? {},
        lastUpdateTime: timeLastUpdateUnix == null
            ? DateTime.now()
            : DateTime.fromMillisecondsSinceEpoch(timeLastUpdateUnix! * 1000),
        nextUpdateTime: timeNextUpdateUnix == null
            ? DateTime.now()
            : DateTime.fromMillisecondsSinceEpoch(timeNextUpdateUnix! * 1000));
  }
}
