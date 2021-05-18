import 'package:business_banking/features/bill_pay/api/first_card/bill_pay_card_response_model.dart';
import 'package:business_banking/features/bill_pay/api/first_card/bill_pay_card_service.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayCardServiceAdapter extends ServiceAdapter<BillPayCardEntity,
    JsonRequestModel, BillPayCardResponseModel, BillPayCardService> {
  BillPayCardServiceAdapter() : super(BillPayCardService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      billsDue: responseModel.billsDue
    );
  }
}
