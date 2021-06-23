import 'package:clean_framework/clean_framework.dart';

class BillsViewModel extends ViewModel {
  final int paidBillsQty;
  final int unpaidBillsQty;
  final double paidBillsAmount;
  final double unpaidBillsAmount;
  final DateTime nextBillPaymentDue;
  final List<Bill> bills;
  
  BillsViewModel({
    required this.paidBillsQty,
    required this.unpaidBillsQty,
    required this.paidBillsAmount,
    required this.unpaidBillsAmount,
    required this.nextBillPaymentDue,
    required this.bills
  });
  
  @override
  List<Object> get props => [
    paidBillsQty,
    unpaidBillsQty,
    paidBillsAmount,
    unpaidBillsAmount,
    nextBillPaymentDue,
    bills
  ];
}

class Bill {
  final String orderTo;
  final bool isPaid;
  final double amount;
  final DateTime dueAt;
  final DateTime paidAt;
  
  Bill({
    required this.orderTo,
    required this.isPaid,
    required this.amount,
    required this.dueAt,
    required this.paidAt
  });
  
  Bill.fromJson(Map<String, dynamic>json):
    orderTo = json['orderTo'] ?? '',
    isPaid = json['isPaid'] == null? false : json['isPaid'] == 1? true: false,
    amount = json['amount'] ?? 0.00,
    dueAt = json['dueAt'] == null? DateTime.fromMicrosecondsSinceEpoch(0) : DateTime.parse(json['dueAt']),
    paidAt = json['paidAt'] == null? DateTime.fromMicrosecondsSinceEpoch(0) : DateTime.parse(json['paidAt']);
}