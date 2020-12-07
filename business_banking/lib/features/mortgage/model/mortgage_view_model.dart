import 'package:clean_framework/clean_framework.dart';
import 'package:intl/intl.dart';

import 'mortgage_entity.dart';

class MortgageViewModel extends ViewModel {
  final String monthlyAmountDue;
  final String paymentDue;

  MortgageViewModel({MortgageEntity mortgageEntity})
      : assert(mortgageEntity != null),
        this.monthlyAmountDue = NumberFormat.simpleCurrency()
            .format(mortgageEntity.monthlyAmountDue),
        this.paymentDue = DateFormat('M/d/y').format(
            DateTime.fromMillisecondsSinceEpoch(
                mortgageEntity.monthlyPaymentDue * 1000));

  @override
  List<Object> get props => [monthlyAmountDue, paymentDue];
}
