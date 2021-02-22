import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class CheckDepositViewModel extends Equatable implements ViewModel {
  final String toAccount;
  final String amount;
  final DateTime date;
  final List<String> toAccounts;
  final String id;
  final String checkFrontImage, checkBackImage;
  final serviceStatus;
  final dataStatus;

  CheckDepositViewModel(
      {this.toAccount,
      this.amount = '',
      this.date,
      this.toAccounts,
      this.id,
      this.checkFrontImage,
      this.checkBackImage,
      this.dataStatus = DataStatus.unknown,
      this.serviceStatus = ServiceStatus.unknown});

  @override
  List<Object> get props => [
        toAccount,
        amount,
        toAccounts,
        id,
        checkFrontImage,
        checkBackImage,
        date
      ];

  @override
  String toString() {
    return "toAccount: $toAccount, amount: $amount, date: $date, toAccounts: $toAccounts, id: $id, checkFrontImage: $checkFrontImage,"
        " checkBackImage: $checkBackImage, dataStatus: $dataStatus, serviceStatus: $serviceStatus";
  }

  static DateTime _getLastMidnight() {
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);
    return lastMidnight;
  }
}
