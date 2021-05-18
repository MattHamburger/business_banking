import 'package:equatable/equatable.dart';

abstract class BillPayEvent extends Equatable {}

class SelectBillEvent implements BillPayEvent {
  final int selectedBillIndex;

  SelectBillEvent(this.selectedBillIndex);

  @override
  List<Object> get props => [selectedBillIndex];

  @override
  bool get stringify => true;
}

class ConfirmBillPayedEvent implements BillPayEvent {
  ConfirmBillPayedEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class PayButtonClickEvent implements BillPayEvent {
  PayButtonClickEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
