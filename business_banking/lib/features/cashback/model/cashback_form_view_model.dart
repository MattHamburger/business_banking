import 'package:clean_framework/clean_framework.dart';

import 'cashback_entity.dart';

class CashbackFormViewModel extends ViewModel {
  final String address;
  final String city;

  final CashbackOption cashbackOption;

  CashbackFormViewModel(this.city, this.address, this.cashbackOption);

  List<Object?> get props => [city, address, cashbackOption];
}

class CashbackConfirmationViewModel extends CashbackFormViewModel {
  final String address;
  final String city;
  final CashbackOption cashbackOption;
  final String confirmationId;

  List<Object?> get props => [city, address, cashbackOption, confirmationId];

  CashbackConfirmationViewModel(
      this.address, this.city, this.cashbackOption, this.confirmationId)
      : super(address, city, cashbackOption);
}

// class Model

// CashbackFormViewModel a = CashbackFormViewModel('Houston')
// CashbackFormViewModel b = CashbackFormViewModel('Houston')

// if (a == b)


