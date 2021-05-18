import 'package:clean_framework/clean_framework.dart';

import 'package:business_banking/features/bill_pay/model/enums.dart';

class BillPayCardViewModel extends ViewModel {
  final int billsDue;
  final serviceRequestStatus;

  BillPayCardViewModel(
      {required this.billsDue,
        this.serviceRequestStatus = ServiceRequestStatus.none});

  @override
  List<Object> get props => [billsDue, serviceRequestStatus];
}
