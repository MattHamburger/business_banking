import 'package:clean_framework/clean_framework.dart';

import 'cashback_entity.dart';

class CashbackFormViewModel extends ViewModel {
  final String city;
  final String address;
  final CashbackOption cashbackOption;

  CashbackFormViewModel(this.city, this.address, this.cashbackOption);

  List<Object?> get props => [city, address, cashbackOption];
}

class CashbackConfirmationViewModel extends CashbackFormViewModel {
  final String city;
  final String address;
  final CashbackOption cashbackOption;
  final String confirmationId;

  List<Object?> get props => [city, address, cashbackOption, confirmationId];

  CashbackConfirmationViewModel(
      this.address, this.city, this.cashbackOption, this.confirmationId)
      : super(address, city, cashbackOption);
}
