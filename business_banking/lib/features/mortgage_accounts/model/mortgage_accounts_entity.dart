import 'package:clean_framework/clean_framework.dart';

class MortgageAccountsEntity extends Entity {
  final String name;
  final String lastFour;
  final double balance;

  MortgageAccountsEntity(
      {List<EntityError> errors = const [],
        String name,
        String lastFour,
        this.balance = 0.00})
      : name = name ?? 'Mortgage',
        lastFour = lastFour ?? '0000',
        super(errors: errors);

  @override
  List<Object> get props => [
    errors, name, lastFour, balance
  ];

  @override
  merge({errors, String name, String lastFour, double balance}) {
    return MortgageAccountsEntity(
        errors: errors ?? this.errors,
        name: name ?? this.name,
        lastFour: lastFour ?? this.lastFour,
        balance: balance ?? this.balance
    );
  }

  @override
  String toString() {
    return "$name $lastFour $balance";
  }
}