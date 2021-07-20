import 'package:business_banking/features/investments/model/quote.dart';
import 'package:clean_framework/clean_framework.dart';

class InvestmentsDetailsViewModel extends ViewModel {
  final String? symbol;
  final Quote? quote;

  InvestmentsDetailsViewModel({this.symbol = '', this.quote});

  @override
  List<Object?> get props => [symbol, quote];
}
