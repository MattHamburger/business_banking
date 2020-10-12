import 'package:business_banking/features/billpay/api/billpay_request_model.dart';
import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/api/billpay_service_response_model.dart';
import 'package:business_banking/features/billpay/model/billpay_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class BillPayServiceAdapter extends ServiceAdapter<BillPayEntity,
    BillPayRequestModel, BillPayServiceResponseModel, BillPayService> {
  //
  BillPayServiceAdapter() : super(BillPayService());

  @override
  BillPayRequestModel createRequest(BillPayEntity entity) {
    return BillPayRequestModel(amount: entity.amount);
  }

  @override
  BillPayEntity createEntity(
    BillPayEntity initialEntity,
    BillPayServiceResponseModel responseModel,
  ) {
    return initialEntity.merge(errors: <EntityError>[]);
  }
}
