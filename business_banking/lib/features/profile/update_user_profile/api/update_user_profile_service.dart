import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_request_model.dart';
import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class UpdateUserProfileService extends EitherService<
    UpdateUserProfileServiceRequestModel,
    UpdateUserProfileServiceResponseModel> {
  UpdateUserProfileService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'update-user-profile');

  @override
  UpdateUserProfileServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return UpdateUserProfileServiceResponseModel.fromJson(jsonResponse);
  }
}
