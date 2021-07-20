import 'package:business_banking/features/investments/model/quote.dart';
import 'package:clean_framework/clean_framework.dart';

class InvestmentsDetailsEntity extends Entity {
  final String? symbol;
  final Quote? quote;

  InvestmentsDetailsEntity(
      {List<EntityFailure> errors = const [], String? symbol, this.quote})
      : symbol = symbol,
        super(errors: errors);

  @override
  List<Object> get props => [errors, symbol!, quote!];

  @override
  InvestmentsDetailsEntity merge({
    List<EntityFailure>? errors,
    String? symbol,
    Quote? quote,
  }) {
    return InvestmentsDetailsEntity(
        errors: errors ?? this.errors,
        symbol: symbol ?? this.symbol,
        quote: quote ?? this.quote);
  }
}
