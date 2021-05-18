import 'package:clean_framework/clean_framework.dart';

import '../bill.dart';
import '../enums.dart';

class BillPayEntity extends Entity {
  final List<Bill> allBills;
  final int selectedBillIndex;
  final PayBillStatus payStatus;
  final String? referenceNumber;

  BillPayEntity({
    List<EntityFailure> errors = const [],
    List<Bill>? allBills,
    int? selectedBillIndex,
    PayBillStatus? payStatus,
    String? referenceNumber,
  })  : allBills = allBills ?? [],
        selectedBillIndex = selectedBillIndex ?? -1,
        payStatus = payStatus ?? PayBillStatus.none,
        referenceNumber = referenceNumber ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    allBills,
    selectedBillIndex,
    payStatus,
    referenceNumber!
  ];

  @override
  BillPayEntity merge({
    List<EntityFailure>? errors,
    List<Bill>? allBills,
    int? selectedBillIndex,
    PayBillStatus? payStatus,
    String? referenceNumber
  }) {
    return BillPayEntity(
      errors: errors ?? this.errors,
      allBills: allBills ?? this.allBills,
      selectedBillIndex: selectedBillIndex ?? this.selectedBillIndex,
      payStatus: payStatus ?? this.payStatus,
      referenceNumber: referenceNumber ?? this.referenceNumber
    );
  }
}
