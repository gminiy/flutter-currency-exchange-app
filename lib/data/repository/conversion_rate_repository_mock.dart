import 'package:flutter_exchange_currency/data/dto/conversion_rate_dto.dart';
import 'package:flutter_exchange_currency/data/mapper/conversion_rate_mapper.dart';
import 'package:flutter_exchange_currency/domain/repository/conversion_rate_repository.dart';

import '../../domain/model/conversion_rate_model.dart';

class ConversionRateRepositoryMock implements ConversionRateRepository {
  @override
  Future<ConversionRateModel> getConversionRate(String baseCode) async {
    final json = {
      "result": "success",
      "documentation": "https://www.exchangerate-api.com/docs",
      "terms_of_use": "https://www.exchangerate-api.com/terms",
      "time_last_update_unix": 1704758401,
      "time_last_update_utc": "Tue, 09 Jan 2024 00:00:01 +0000",
      "time_next_update_unix": DateTime.now().millisecondsSinceEpoch ~/ 1000,
      "time_next_update_utc": "Wed, 10 Jan 2024 00:00:01 +0000",
      "base_code": "USD",
      "conversion_rates": {
        "USD": 1,
        "AED": 3.6725,
        "AFN": 71.2547,
        "ALL": 96.1317,
        "AMD": 405.3378,
        "ANG": 1.7900,
        "AOA": 843.2475,
        "ARS": 813.8500,
        "AUD": 1.4901,
        "AWG": 1.7900,
        "AZN": 1.6996,
        "BAM": 1.7858,
        "BBD": 2.0000,
        "BDT": 109.6317,
        "BGN": 1.7859,
        "BHD": 0.3760,
        "BIF": 2840.4514,
        "BMD": 1.0000,
        "BND": 1.3290,
        "BOB": 6.8057,
        "BRL": 4.8761,
        "BSD": 1.0000,
        "BTN": 83.0905,
        "BWP": 13.5853,
        "BYN": 3.2300,
        "BZD": 2.0000,
        "CAD": 1.3363,
        "CDF": 2697.6354,
        "CHF": 0.8486,
        "CLP": 890.9215,
        "CNY": 7.1620,
        "COP": 3965.8708,
        "CRC": 517.0785,
        "CUP": 24.0000,
        "CVE": 100.6801,
        "CZK": 22.3925,
        "DJF": 177.7210,
        "DKK": 6.8115,
        "DOP": 56.8164,
        "DZD": 133.3584,
        "EGP": 30.8636,
        "ERN": 15.0000,
        "ETB": 56.5681,
        "EUR": 0.9131,
        "FJD": 2.2076,
        "FKP": 0.7851,
        "FOK": 6.8110,
        "GBP": 0.7852,
        "GEL": 2.6867,
        "GGP": 0.7851,
        "GHS": 11.9511,
        "GIP": 0.7851,
        "GMD": 65.2276,
        "GNF": 8573.4984,
        "GTQ": 7.7030,
        "GYD": 209.2533,
        "HKD": 7.8070,
        "HNL": 24.2965,
        "HRK": 6.8796,
        "HTG": 132.3854,
        "HUF": 344.6386,
        "IDR": 15522.2357,
        "ILS": 3.7081,
        "IMP": 0.7851,
        "INR": 83.0892,
        "IQD": 1308.1089,
        "IRR": 42103.4138,
        "ISK": 137.6970,
        "JEP": 0.7851,
        "JMD": 154.4428,
        "JOD": 0.7090,
        "JPY": 144.2103,
        "KES": 157.4841,
        "KGS": 89.0684,
        "KHR": 4097.7151,
        "KID": 1.4900,
        "KMF": 449.2030,
        "KRW": 1315.5765,
        "KWD": 0.3071,
        "KYD": 0.8333,
        "KZT": 454.0495,
        "LAK": 20260.1876,
        "LBP": 15000.0000,
        "LKR": 322.1720,
        "LRD": 187.9086,
        "LSL": 18.6020,
        "LYD": 4.8012,
        "MAD": 9.9345,
        "MDL": 17.4975,
        "MGA": 4588.6025,
        "MKD": 56.3166,
        "MMK": 2069.2881,
        "MNT": 3448.9281,
        "MOP": 8.0414,
        "MRU": 39.5491,
        "MUR": 44.1977,
        "MVR": 15.4268,
        "MWK": 1691.0413,
        "MXN": 16.8508,
        "MYR": 4.6509,
        "MZN": 63.8773,
        "NAD": 18.6020,
        "NGN": 901.9170,
        "NIO": 36.0196,
        "NOK": 10.3662,
        "NPR": 132.9449,
        "NZD": 1.6017,
        "OMR": 0.3845,
        "PAB": 1.0000,
        "PEN": 3.7032,
        "PGK": 3.6614,
        "PHP": 55.7067,
        "PKR": 280.7891,
        "PLN": 3.9631,
        "PYG": 7250.1128,
        "QAR": 3.6400,
        "RON": 4.5444,
        "RSD": 107.1863,
        "RUB": 90.9441,
        "RWF": 1298.9857,
        "SAR": 3.7500,
        "SBD": 8.4613,
        "SCR": 13.5272,
        "SDG": 454.0633,
        "SEK": 10.2353,
        "SGD": 1.3291,
        "SHP": 0.7851,
        "SLE": 22.9395,
        "SLL": 22939.4972,
        "SOS": 571.3518,
        "SRD": 36.5401,
        "SSP": 1094.8314,
        "STN": 22.3703,
        "SYP": 12692.8338,
        "SZL": 18.6020,
        "THB": 34.9519,
        "TJS": 10.9513,
        "TMT": 3.5000,
        "TND": 3.0952,
        "TOP": 2.3197,
        "TRY": 29.9170,
        "TTD": 6.6931,
        "TVD": 1.4900,
        "TWD": 30.8879,
        "TZS": 2517.4349,
        "UAH": 38.2079,
        "UGX": 3803.5335,
        "UYU": 38.9156,
        "UZS": 12334.3440,
        "VES": 35.9385,
        "VND": 24282.2837,
        "VUV": 118.7018,
        "WST": 2.7071,
        "XAF": 598.9374,
        "XCD": 2.7000,
        "XDR": 0.7486,
        "XOF": 598.9374,
        "XPF": 108.9590,
        "YER": 246.2931,
        "ZAR": 18.6007,
        "ZMW": 25.9415,
        "ZWL": 6436.6326
      }
    };

    final dto = ConversionRateDTO.fromJson(json);
    return dto.toConversionRateModel();
  }
}
