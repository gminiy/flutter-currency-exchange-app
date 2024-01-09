import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(1) num currency,
    @Default(1) num baseAmount,
    @Default(1) num targetAmount,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, Object?> json) => _$HomeStateFromJson(json);
}