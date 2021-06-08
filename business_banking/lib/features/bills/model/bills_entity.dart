import 'package:clean_framework/clean_framework.dart';
import 'bills_view_model.dart';

class BillsEntity extends Entity {
  final int paidBillsQty;
  final int unpaidBillsQty;
  final double paidBillsAmount;
  final double unpaidBillsAmount;
  final DateTime nextBillPaymentDue;
  final List<Bill> bills;
  
  BillsEntity({
    List<EntityFailure> errors = const [],
    int? paidBillsQty,
    int? unpaidBillsQty,
    double? paidBillsAmount,
    double? unpaidBillsAmount,
    DateTime? nextBillPaymentDue,
    List<Bill>? bills
  }) : paidBillsQty = paidBillsQty?? 0,
       unpaidBillsQty = unpaidBillsQty?? 0,
       paidBillsAmount = paidBillsAmount?? 0.00,
       unpaidBillsAmount = unpaidBillsAmount?? 0.00,
       nextBillPaymentDue = nextBillPaymentDue?? DateTime.fromMicrosecondsSinceEpoch(0),
       bills = bills?? List<Bill>.empty(growable: false),
       super(errors: errors);
  
  @override
  List<Object> get props => [
          errors,
          paidBillsQty,
          unpaidBillsQty,
          paidBillsAmount,
          unpaidBillsAmount,
          nextBillPaymentDue,
          bills
  ];
  
  @override
  merge({
    errors,
    int? paidBillsQty,
    int? unpaidBillsQty,
    double? paidBillsAmount,
    double? unpaidBillsAmount,
    DateTime? nextBillPaymentDue,
    List<Bill>? bills
  }) {
    BillsEntity be = BillsEntity(
      errors: errors?? this.errors,
      paidBillsQty: paidBillsQty?? this.paidBillsQty,
      unpaidBillsQty: unpaidBillsQty?? this.unpaidBillsQty,
      paidBillsAmount: paidBillsAmount?? this.paidBillsAmount,
      unpaidBillsAmount: unpaidBillsAmount?? this.unpaidBillsAmount,
      nextBillPaymentDue: nextBillPaymentDue?? this.nextBillPaymentDue,
      bills: bills?? this.bills
    );
    return be;
  }
}