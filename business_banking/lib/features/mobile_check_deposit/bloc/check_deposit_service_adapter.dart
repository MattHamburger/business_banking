import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_request_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_response_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_service.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CheckDepositServiceAdapter extends ServiceAdapter<
    CheckDepositEntity,
    CheckDepositRequestModel,
    CheckDepositResponseModel,
    CheckDepositService> {
  CheckDepositServiceAdapter() : super(CheckDepositService());

  @override
  CheckDepositRequestModel createRequest(CheckDepositEntity entity) {
    CheckDepositRequestModel model = CheckDepositRequestModel(
        toAccount: entity.toAccount,
        checkFrontImage: entity.checkFrontImage,
        checkBackImage: entity.checkBackImage,
        amount: entity.amount,
        date: entity.date);
    print(model.toJson().toString());
    return model;
  }

  @override
  CheckDepositEntity createEntity(CheckDepositEntity initialEntity,
      CheckDepositResponseModel responseModel) {
    return initialEntity
        .merge(errors: <EntityFailure>[], id: responseModel.confirmation);
  }
}
