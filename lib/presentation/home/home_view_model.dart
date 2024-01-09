import 'package:flutter/material.dart';
import 'package:flutter_exchange_currency/domain/use_case/get_currency_use_case.dart';

import '../../core/result.dart';
import 'home_state.dart';

class HomeViewModel extends ChangeNotifier{
  HomeState _state;
  final GetCurrencyUseCase _getCurrencyUseCase;

  HomeState get state => _state;

  HomeViewModel({
    required HomeState state,
    required GetCurrencyUseCase getCurrencyUseCase,
  })  : _state = state,
        _getCurrencyUseCase = getCurrencyUseCase;

  Future<void> getCurrency() async {
    final Result result = await _getCurrencyUseCase.execute();
    switch (result) {
      case Success():
        _state = state.copyWith(
          currency: result.data,
        );
        notifyListeners();
      case Error():
        print('Error');
    }
  }

}