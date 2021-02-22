import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CheckDepositRequestModel extends Equatable implements JsonRequestModel {
  final String toAccount;
  final String checkFrontImage;
  final String checkBackImage;
  final String amount;
  final DateTime date;

  CheckDepositRequestModel(
      {
        this.toAccount,
        this.checkFrontImage,
        this.checkBackImage,
        this.amount,
        this.date
      });

  @override
  Map<String, dynamic> toJson() {
    return {
      'toAccount': toAccount,
      'checkFrontImage': checkFrontImage,
      'checkBackImage': checkBackImage,
      'amount': amount,
      'date': date.toIso8601String()
    };
  }

  @override
  List<Object> get props => [toAccount,checkFrontImage,checkBackImage, amount, date];
}