class ConversionRateDTO {
  final String? result;
  final String? documentation;
  final String? termsOfUse;
  final int? timeLastUpdateUnix;
  final String? timeLastUpdateUtc;
  final int? timeNextUpdateUnix;
  final String? timeNextUpdateUtc;
  final String? baseCode;
  final Map<String, num>? conversionRates;

  ConversionRateDTO({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  factory ConversionRateDTO.fromJson(Map<String, dynamic> json) {
    return ConversionRateDTO(
      result: json['result'] as String?,
      documentation: json['documentation'] as String?,
      termsOfUse: json['terms_of_use'] as String?,
      timeLastUpdateUnix: json['time_last_update_unix'] as int?,
      timeLastUpdateUtc: json['time_last_update_utc'] as String?,
      timeNextUpdateUnix: json['time_next_update_unix'] as int?,
      timeNextUpdateUtc: json['time_next_update_utc'] as String?,
      baseCode: json['base_code'] as String?,
      conversionRates: (json['conversion_rates'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value)),
    );
  }
}
