part of 'credit_bloc.dart';

@immutable
sealed class CreditEvent {}

class CreditPostEvent extends CreditEvent {
  final CreditModel credit;

  CreditPostEvent({required this.credit});
}

class CreditInitialEvent extends CreditEvent {
  CreditInitialEvent();
}
