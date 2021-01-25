import 'package:business_banking/features/bank_locator/api/bank_locator_service.dart';
import 'package:business_banking/features/bank_locator/api/bank_locator_service_request_model.dart';
import 'package:business_banking/features/bank_locator/api/bank_locator_service_response_model.dart';
import 'package:business_banking/features/bank_locator/model/bank_locator_entity.dart';
import 'package:clean_framework/clean_framework.dart';

/// Responsible for connecting the contents of the API and the UseCase
/// Called when a UseCase requests data or sends data
class BankLocatorServiceAdapter extends ServiceAdapter<
    BankLocatorEntity,
    BankLocatorServiceRequestModel,
    BankLocatorServiceResponseModel,
    BankLocatorService> {
  BankLocatorServiceAdapter() : super(BankLocatorService());

  @override
  BankLocatorServiceRequestModel createRequest(BankLocatorEntity entity) =>
      BankLocatorServiceRequestModel(
        longitude: entity.longitude,
        latitude: entity.latitude,
      );

  @override
  BankLocatorEntity createEntity(BankLocatorEntity initialEntity,
          BankLocatorServiceResponseModel responseModel) =>
      initialEntity.merge(errors: <EntityFailure>[]);
}
