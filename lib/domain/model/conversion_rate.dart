import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'conversion_rate.freezed.dart';

part 'conversion_rate.g.dart';

@freezed
class ConversionRate with _$ConversionRate {
  const factory ConversionRate({
    required Map<String, num> rates,
    required DateTime lastUpdateTime,
    required DateTime nextUpdateTime,
  }) = _ConversionRate;

  factory ConversionRate.fromJson(Map<String, Object?> json) =>
      _$ConversionRateFromJson(json);
}
