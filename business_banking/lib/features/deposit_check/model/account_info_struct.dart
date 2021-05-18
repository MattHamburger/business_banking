import 'package:equatable/equatable.dart';

class AccountInfoStruct extends Equatable {
  final String accountNumber;
  final double availableBalance;
  final double depositLimit;
  final String accountNickname;

  AccountInfoStruct(
      {this.accountNumber = '',
      this.availableBalance = 0.0,
      this.depositLimit = 0.0,
      this.accountNickname = ''});

  AccountInfoStruct.fromJson(Map<String, dynamic> json)
      : accountNumber = json['accountNumber'] ?? '',
        availableBalance = json['availableBalance'] ?? 0.0,
        depositLimit = json['depositLimit'] ?? 0.0,
        accountNickname = json['accountNickname'] ?? '';

  @override
  List<Object> get props =>
      [accountNumber, availableBalance, depositLimit, accountNickname];
}
