import 'package:business_banking/features/cashback/api/cashback_enrollment_service.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackEnrollmentServiceAdapter extends ServiceAdapter<
    CashbackEntity,
    CashbackEnrollmentRequestModel,
    CashbackEnrollmentResponseModel,
    CashbackEnrollmentService> {
  CashbackEnrollmentServiceAdapter() : super(CashbackEnrollmentService());

  @override
  CashbackEntity createEntity(CashbackEntity currentEntity,
      CashbackEnrollmentResponseModel responseModel) {
    return currentEntity.merge(
      confirmationId: responseModel.confirmationId,
    );
  }

  @override
  CashbackEnrollmentRequestModel? createRequest(CashbackEntity entity) =>
      CashbackEnrollmentRequestModel(
        address: entity.address,
        city: entity.city,
        type: _CashbackOptionToTypeMap[entity.cashbackOption] ??
            CashbackEnrollmentType.miles,
      );

  static final _CashbackOptionToTypeMap = {
    CashbackOption.frequentMiles: CashbackEnrollmentType.miles,
    CashbackOption.storesDiscount: CashbackEnrollmentType.discounts,
  };
}
