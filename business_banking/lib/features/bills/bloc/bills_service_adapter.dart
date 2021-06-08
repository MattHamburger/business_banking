import 'package:business_banking/features/bills/api/bills_service_response_model.dart';
import 'package:business_banking/features/bills/model/bills_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/bills/api/bills_service.dart';

// here comes the logic for processing the bill list and load the other fields

class BillsServiceAdapter extends ServiceAdapter<BillsEntity, JsonRequestModel, BillsServiceResponseModel, BillsService> {
  BillsServiceAdapter() : super(BillsService());
  
  @override
  BillsEntity createEntity(BillsEntity billsEntityModel, BillsServiceResponseModel responseModel) {
    int paidBillsQty = 0;
    int unpaidBillsQty = 0;
    double paidBillsAmount = 0.00;
    double unpaidBillsAmount = 0.00;
    DateTime nextBillPaymentDue = DateTime.fromMicrosecondsSinceEpoch(0);
    
    responseModel.bills.forEach((bill) {
      if(bill.isPaid) {
        paidBillsQty++;
        paidBillsAmount += bill.amount;
      } else {
        unpaidBillsQty++;
        unpaidBillsAmount += bill.amount;
        if(bill.dueAt.isBefore(nextBillPaymentDue)) nextBillPaymentDue = bill.dueAt;
      }
    });
    
    BillsEntity be =  billsEntityModel.merge(
      paidBillsQty: paidBillsQty,
      unpaidBillsQty: unpaidBillsQty,
      paidBillsAmount: paidBillsAmount,
      unpaidBillsAmount: unpaidBillsAmount,
      nextBillPaymentDue: nextBillPaymentDue,
      bills: responseModel.bills
    ) as BillsEntity;
    return be;
  }
}