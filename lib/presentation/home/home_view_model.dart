import 'package:flutter/material.dart';
import 'package:flutter_exchange_currency/domain/use_case/get_currency_use_case.dart';

import '../../core/result.dart';
import 'home_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeState _state = const HomeState();
  final GetCurrencyUseCase _getCurrencyUseCase;

  HomeState get state => _state;

  HomeViewModel({
    required GetCurrencyUseCase getCurrencyUseCase,
  }) : _getCurrencyUseCase = getCurrencyUseCase;

  Future<void> getCurrency(
      {required String baseCode, required String targetCode}) async {
    _state = state.copyWith(baseCode: baseCode, targetCode: targetCode);

    final Result result = await _getCurrencyUseCase.execute(
      baseCode: state.baseCode,
      targetCode: state.targetCode,
    );

    switch (result) {
      case Success():
        _state = state.copyWith(
          currency: result.data,
        );
        notifyListeners();
      case Error():
        print('Error');
        notifyListeners();
    }
  }

  calcBaseAmount(num targetAmount) {
    final num baseAmount = targetAmount / state.currency;
    _state = state.copyWith(baseAmount: baseAmount, targetAmount: targetAmount);
    notifyListeners();
  }

  calcTargetAmount(num baseAmount) {
    final num targetAmount = baseAmount * state.currency;
    _state = state.copyWith(baseAmount: baseAmount, targetAmount: targetAmount);
    notifyListeners();
  }
}
