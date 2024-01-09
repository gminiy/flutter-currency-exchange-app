import 'package:flutter_exchange_currency/data/data_source/remote/conversion_rate_api.dart';
import 'package:flutter_exchange_currency/data/dto/conversion_rate_dto.dart';
import 'package:flutter_exchange_currency/data/mapper/conversion_rate_mapper.dart';
import 'package:flutter_exchange_currency/domain/repository/conversion_rate_repository.dart';

import '../../domain/model/conversion_rate_model.dart';

class ConversionRateRepositoryImpl implements ConversionRateRepository {
  final ConversionRateApi _api;

  const ConversionRateRepositoryImpl({
    required ConversionRateApi api,
  }) : _api = api;

  @override
  Future<ConversionRateModel> getConversionRate(String baseCode) async {
    final json = await _api.getConversionRate(baseCode);

    final dto = ConversionRateDTO.fromJson(json);
    return dto.toConversionRateModel();
  }
}
