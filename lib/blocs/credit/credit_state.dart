part of 'credit_bloc.dart';

@immutable
sealed class CreditState {}

final class CreditInitial extends CreditState {}

final class CreditLoading extends CreditState {}

final class CreditSuccess extends CreditState {
  final bool prediction;

  CreditSuccess(this.prediction);
}

final class CreditError extends CreditState {
  final String message;

  CreditError(this.message);
}
