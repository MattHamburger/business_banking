import 'package:equatable/equatable.dart';

abstract class InvestmentsDetailsEvent extends Equatable {}

class UpdateSymbolEvent implements InvestmentsDetailsEvent {
  final String symbol;

  UpdateSymbolEvent(this.symbol);

  @override
  List<Object> get props => [symbol];

  @override
  bool get stringify => true;
}
