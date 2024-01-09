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
    final Result result = await _getCurrencyUseCase.execute(
      baseCode: state.baseCode,
      targetCode: state.targetCode,
    );
    switch (result) {
      case Success():
        _state = state.copyWith(
          currency: result.data,
        );경
        notifyListeners();
      case Error():
        print('Error');
    }
  }

  calcBaseAmount() {
    final num baseAmount = state.targetAmount / state.currency;
    _state = state.copyWith(baseAmount: baseAmount);
    notifyListeners();
  }

  calcTargetAmount() {
    final num targetAmount = state.baseAmount * state.currency;
    _state = state.copyWith(targetAmount: targetAmount);
    notifyListeners();
  }
}
