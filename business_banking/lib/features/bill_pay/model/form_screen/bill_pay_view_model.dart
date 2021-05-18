import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';

import '../bill.dart';

class BillPayViewModel extends ViewModel {
  final List<Bill> allBills;
  final selectedBillIndex;
  final serviceRequestStatus;
  final payStatus;
  final referenceNumber;

  BillPayViewModel(
      {required this.allBills,
        this.serviceRequestStatus = ServiceRequestStatus.none,
        this.selectedBillIndex = -1,
        this.payStatus = PayBillStatus.none,
        this.referenceNumber = ''});

  @override
  List<Object> get props => [
    allBills,
    selectedBillIndex,
    serviceRequestStatus,
    payStatus,
    referenceNumber];
}
