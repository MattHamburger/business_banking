import 'package:clean_framework/clean_framework.dart';
import 'package:intl/intl.dart';

import 'mortgage_entity.dart';

class MortgageDetailViewModel extends ViewModel {
  final String escrowBalanceString;
  final String feesChargedString;
  final String loanNum;

  MortgageDetailViewModel({MortgageEntity mortgageEntity})
      : assert(mortgageEntity != null),
        escrowBalanceString =
            NumberFormat.simpleCurrency().format(mortgageEntity.escrowBalance),
        feesChargedString =
            NumberFormat.simpleCurrency().format(mortgageEntity.feesCharged),
        loanNum = mortgageEntity.loanNumber.toString();

  @override
  List<Object> get props => [escrowBalanceString, feesChargedString, loanNum];
}
