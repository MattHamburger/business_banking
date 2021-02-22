import 'package:clean_framework/clean_framework.dart';

class CheckDepositEntity extends Entity{
  final String id;
  final String toAccount;
  final String checkFrontImage;
  final String checkBackImage;
  final String amount;
  final DateTime date;
  final List<String> toAccounts;

  CheckDepositEntity(
      {List<EntityFailure> errors = const [],
        String toAccount,
        String checkFrontImage,
        String checkBackImage,
        String amount = '',
        DateTime date,
        List<String> toAccounts,
        String id})
      :
        this.toAccount = toAccount,
        this.checkFrontImage = checkFrontImage,
        this.checkBackImage = checkBackImage,
        this.amount = amount,
        this.date = date ?? _getLastMidnight(),
        this.toAccounts = toAccounts,
        this.id = id;

  @override
  List<Object> get props => [
    errors, id, toAccount, checkFrontImage, checkBackImage, amount, date,toAccounts
  ];

  @override
  merge({errors, String id, String toAccount, String checkFrontImage, String checkBackImage, String amount, DateTime date,List<String> toAccounts}) {
    return CheckDepositEntity(
        errors: errors ?? this.errors,
        id: id ?? this.id,
        toAccount: toAccount ?? this.toAccount,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        toAccounts: toAccounts ?? this.toAccounts,
        checkFrontImage: checkFrontImage ?? this.checkFrontImage,
        checkBackImage: checkBackImage ?? this.checkBackImage,
    );
  }

  @override
  String toString() {
    return "$id $toAccount $checkFrontImage $checkBackImage $amount $date $toAccounts";
  }

  static DateTime _getLastMidnight() {
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);
    return lastMidnight;
  }
}