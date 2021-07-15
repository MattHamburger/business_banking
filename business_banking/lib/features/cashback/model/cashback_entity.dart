import 'package:clean_framework/clean_framework.dart';

class CashbackEntity extends Entity {
  final String address;
  final String city;

  final CashbackOption cashbackOption;

  final String confirmationId;

  CashbackEntity({
    this.city = '',
    this.address = '',
    this.cashbackOption = CashbackOption.frequentMiles,
    this.confirmationId = '',
  });

  List<Object?> get props => [city, address, cashbackOption, confirmationId];
}

enum CashbackOption { frequentMiles, storesDiscount }
