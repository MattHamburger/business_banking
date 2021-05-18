import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_request_model.dart';
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_response_model.dart';
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_service.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class BillPayPostServiceAdapter extends ServiceAdapter<
    BillPayEntity,
    BillPayPostRequestModel,
    BillPayPostResponseModel,
    BillPayPostService> {
  BillPayPostServiceAdapter() : super(BillPayPostService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      payStatus: responseModel.didSucceed
          ? PayBillStatus.success : PayBillStatus.failed,
      referenceNumber: responseModel.referenceNumber
    );
  }

  @override
  BillPayPostRequestModel createRequest(BillPayEntity entity) {
    return BillPayPostRequestModel(
        billId: entity.allBills[entity.selectedBillIndex].id,
    );
  }
}