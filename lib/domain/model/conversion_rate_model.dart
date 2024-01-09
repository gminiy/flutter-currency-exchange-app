import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'conversion_rate_model.freezed.dart';

part 'conversion_rate_model.g.dart';

@freezed
class ConversionRateModel with _$ConversionRateModel {
  const factory ConversionRateModel({
    required Map<String, num> rates,
    required DateTime lastUpdateTime,
    required DateTime nextUpdateTime,
  }) = _ConversionRateModel;

  factory ConversionRateModel.fromJson(Map<String, Object?> json) => _$ConversionRateModelFromJson(json);
}