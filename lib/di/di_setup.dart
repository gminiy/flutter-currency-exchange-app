import 'package:dio/dio.dart';
import 'package:flutter_exchange_currency/data/data_source/remote/conversion_rate_api.dart';
import 'package:flutter_exchange_currency/data/repository/conversion_rate_repository_impl.dart';
import 'package:flutter_exchange_currency/domain/repository/conversion_rate_repository.dart';
import 'package:flutter_exchange_currency/domain/use_case/get_currency_use_case.dart';
import 'package:flutter_exchange_currency/presentation/home/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ConversionRateApi>(
      ConversionRateApi(dio: getIt<Dio>()));
  getIt.registerSingleton<ConversionRateRepository>(
      ConversionRateRepositoryImpl(api: getIt<ConversionRateApi>()));
  getIt.registerSingleton<GetCurrencyUseCase>(GetCurrencyUseCase(
      conversionRateRepository: getIt<ConversionRateRepository>()));

  getIt.registerFactory(
      () => HomeViewModel(getCurrencyUseCase: getIt<GetCurrencyUseCase>()));
}
