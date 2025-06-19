part of 'currency_bloc.dart';

@immutable
sealed class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencySuccess extends CurrencyState {
  final CurrencyResponse currencyResponse;

  CurrencySuccess({required this.currencyResponse});
}

final class CurrencyFailure extends CurrencyState {
  final String  errMessage;

  CurrencyFailure({required this.errMessage});
}
