import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service.dart';
import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_request_model.dart';
import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_response_model.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class UpdateUserProfileRequestServiceAdapter extends ServiceAdapter<
    UpdateUserProfileEntity,
    UpdateUserProfileServiceRequestModel,
    UpdateUserProfileServiceResponseModel,
    UpdateUserProfileService> {
  UpdateUserProfileRequestServiceAdapter() : super(UpdateUserProfileService());

  @override
  UpdateUserProfileEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      errors: <EntityFailure>[],
      isProfileUpdated: responseModel.isProfileUpdated,
    ) as UpdateUserProfileEntity;
  }

  @override
  UpdateUserProfileServiceRequestModel createRequest(
      UpdateUserProfileEntity entity) {
    return UpdateUserProfileServiceRequestModel(
      userName: entity.userName,
      phoneNumber: entity.phoneNumber,
      email: entity.email,
      address: entity.phoneNumber,
    );
  }
}
