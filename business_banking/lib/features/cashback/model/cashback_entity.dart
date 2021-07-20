import 'package:clean_framework/clean_framework.dart';

class CashbackEntity extends Entity {
  final String address;
  final String city;

  final CashbackOption cashbackOption;

  final String confirmationId;

  CashbackEntity({
    List<EntityFailure> errors = const [],
    this.city = '',
    this.address = '',
    this.cashbackOption = CashbackOption.frequentMiles,
    this.confirmationId = '',
  });

  List<Object?> get props => [city, address, cashbackOption, confirmationId];

  @override
  CashbackEntity merge({
    List<EntityFailure>? errors,
    String? address,
    String? city,
    CashbackOption? cashbackOption,
    String? confirmationId,
  }) {
    return CashbackEntity(
      errors: errors ?? this.errors,
      address: address ?? this.address,
      city: city ?? this.city,
      cashbackOption: cashbackOption ?? this.cashbackOption,
      confirmationId: confirmationId ?? this.confirmationId,
    );
  }
}

enum CashbackOption { frequentMiles, storesDiscount }
