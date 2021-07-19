import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_form_entry/update_user_profile_service_adapter.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_entity.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_enums.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_success/update_user_profile_success_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class UpdateUserProfileSuccessUseCase extends UseCase {
  RepositoryScope? __scopeRegistrationStatusResponse;
  final ViewModelCallback<ViewModel> _viewModelCallBack;

  UpdateUserProfileSuccessUseCase(
      ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    __scopeRegistrationStatusResponse = ExampleLocator()
        .repository
        .create<UpdateUserProfileEntity>(
            UpdateUserProfileEntity(), _notifySubscribers);

    await ExampleLocator().repository.runServiceAdapter(
        __scopeRegistrationStatusResponse!,
        UpdateUserProfileRequestServiceAdapter());

    sendViewModelToSubscribers();
  }

  void sendViewModelToSubscribers() {
    UpdateUserProfileEntity updateUserProfileEntity =
        ExampleLocator().repository.get(__scopeRegistrationStatusResponse!);
    _notifySubscribers(updateUserProfileEntity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  UpdateUserProfileSuccessViewModel buildViewModel(
      UpdateUserProfileEntity updateUserProfileEntity) {
    if (updateUserProfileEntity.errors.length > 0)
      return buildViewModelStatusError(updateUserProfileEntity);
    else
      return buildViewModelStatusOK(updateUserProfileEntity);
  }

  UpdateUserProfileSuccessViewModel buildViewModelStatusOK(
      UpdateUserProfileEntity updateUserProfileEntity) {
    return UpdateUserProfileSuccessViewModel(
      userName: updateUserProfileEntity.userName,
      isProfileUpdated: true,
      serviceResponseStatus: UserProfileUpdateResponseStatus.succeed,
    );
  }

  UpdateUserProfileSuccessViewModel buildViewModelStatusError(
      UpdateUserProfileEntity updateUserProfileEntity) {
    return UpdateUserProfileSuccessViewModel(
      userName: updateUserProfileEntity.userName,
      isProfileUpdated: false,
      serviceResponseStatus: UserProfileUpdateResponseStatus.failed,
    );
  }
}
