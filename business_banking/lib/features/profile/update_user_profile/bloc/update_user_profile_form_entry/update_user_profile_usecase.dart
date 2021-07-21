import 'package:business_banking/dependency/package_info_plugin.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_entity.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_enums.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class UpdateUserProfileUseCase extends UseCase {
  RepositoryScope? _scopeRegistrationFormEntity;
  late final PackageInfoPlugin _packageInfoPluginImpl;
  final ViewModelCallback<ViewModel> _viewModelCallBack;

  UpdateUserProfileUseCase(ViewModelCallback<ViewModel> viewModelCallBack,
      PackageInfoPlugin packageInfoPlugin)
      : _viewModelCallBack = viewModelCallBack,
        _packageInfoPluginImpl = packageInfoPlugin {}

  Future<void> init() async {
    final appInfo = await _packageInfoPluginImpl.getAppInfo();
  }

  Future<void> create() async {
    _scopeRegistrationFormEntity = ExampleLocator()
        .repository
        .create<UpdateUserProfileEntity>(
            UpdateUserProfileEntity(), _notifySubscribers);
    UpdateUserProfileEntity updateUserProfileEntity =
        ExampleLocator().repository.get(_scopeRegistrationFormEntity!);

    _notifySubscribers(updateUserProfileEntity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel());
  }

  UpdateUserProfileViewModel buildViewModel({
    status: '',
    inputStatusType = UserProfileUpdateInputStatusType.unknown,
    UpdateUserProfileEntity? updateUserProfileEntity,
  }) {
    updateUserProfileEntity = updateUserProfileEntity ??
        ExampleLocator().repository.get(_scopeRegistrationFormEntity!);
    if (updateUserProfileEntity.hasErrors()) {
      return UpdateUserProfileViewModel(
        userName: updateUserProfileEntity.userName,
        phoneNumber: updateUserProfileEntity.phoneNumber,
        email: updateUserProfileEntity.email,
        address: updateUserProfileEntity.address,
        userNameStatus:
            inputStatusType == UserProfileUpdateInputStatusType.userName
                ? status
                : '',
        phoneNumberStatus:
            inputStatusType == UserProfileUpdateInputStatusType.phoneNumber
                ? status
                : '',
        userEmailStatus:
            inputStatusType == UserProfileUpdateInputStatusType.email
                ? status
                : '',
        addressStatus:
            inputStatusType == UserProfileUpdateInputStatusType.address
                ? status
                : '',
        serviceResponseStatus: UserProfileUpdateResponseStatus.failed,
      );
    } else {
      return UpdateUserProfileViewModel(
        userName: updateUserProfileEntity.userName,
        phoneNumber: updateUserProfileEntity.phoneNumber,
        email: updateUserProfileEntity.email,
        address: updateUserProfileEntity.address,
        userNameStatus:
            inputStatusType == UserProfileUpdateInputStatusType.userName
                ? status
                : '',
        phoneNumberStatus:
            inputStatusType == UserProfileUpdateInputStatusType.phoneNumber
                ? status
                : '',
        userEmailStatus:
            inputStatusType == UserProfileUpdateInputStatusType.email
                ? status
                : '',
        addressStatus:
            inputStatusType == UserProfileUpdateInputStatusType.address
                ? status
                : '',
        serviceResponseStatus: UserProfileUpdateResponseStatus.succeed,
      );
    }
  }

  updateAddress(String address) {
    final UpdateUserProfileEntity entity = ExampleLocator()
        .repository
        .get<UpdateUserProfileEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(address: address);
    ExampleLocator().repository.update<UpdateUserProfileEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as UpdateUserProfileEntity);
    String? checkUserInputStatus = validateUserAddress(address);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: UserProfileUpdateInputStatusType.address,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  updatePhoneNumber(String _phoneNumber) {
    final UpdateUserProfileEntity entity = ExampleLocator()
        .repository
        .get<UpdateUserProfileEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(phoneNumber: _phoneNumber);
    ExampleLocator().repository.update<UpdateUserProfileEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as UpdateUserProfileEntity);
    String? checkUserInputStatus = validatePhoneNumber(_phoneNumber);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: UserProfileUpdateInputStatusType.phoneNumber,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  updateEmail(String _email) {
    final UpdateUserProfileEntity entity = ExampleLocator()
        .repository
        .get<UpdateUserProfileEntity>(_scopeRegistrationFormEntity!);
    final updatedEntity = entity.merge(email: _email);
    ExampleLocator().repository.update<UpdateUserProfileEntity>(
        _scopeRegistrationFormEntity!,
        updatedEntity as UpdateUserProfileEntity);
    String checkUserInputStatus = validateEmail(_email);
    if (checkUserInputStatus.isNotEmpty) {
      _viewModelCallBack(buildViewModel(
        status: checkUserInputStatus,
        inputStatusType: UserProfileUpdateInputStatusType.email,
      ));
    } else {
      _viewModelCallBack(buildViewModel());
    }
  }

  String validateUserAddress(String address) {
    // validates to contain only alphanumeric in address filed
    if (address.isNotEmpty &&
        address.contains(RegExp(r'^[a-zA-Z0-9]+$')) == true) {
      return '';
    } else {
      return "Please provide valid address.";
    }
  }

  String validatePhoneNumber(String phoneNumber) {
    RegExp regExp = new RegExp(r"[^0-9]");
    phoneNumber = phoneNumber.replaceAll(regExp, '');
    // phone number must be 10 digits long
    if (phoneNumber.isNotEmpty &&
        phoneNumber.contains(
                RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/')) ==
            true) {
      return '';
    } else {
      return "Please provide valid phone Number.";
    }
  }

  String validateEmail(String userEmail) {
    if (userEmail.isNotEmpty &&
        userEmail.contains(RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')) ==
            true) {
      return '';
    } else {
      return "Please, provide a valid email.";
    }
  }
}
