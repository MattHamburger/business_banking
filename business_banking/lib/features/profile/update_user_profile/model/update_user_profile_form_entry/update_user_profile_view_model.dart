import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class UpdateUserProfileViewModel extends ViewModel {
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? userNameStatus;
  final String? phoneNumberStatus;
  final String? userEmailStatus;
  final String? addressStatus;
  final serviceResponseStatus;

  UpdateUserProfileViewModel(
      {required this.userName,
      required this.phoneNumber,
      required this.email,
      required this.address,
      required this.userNameStatus,
      required this.phoneNumberStatus,
      required this.userEmailStatus,
      required this.addressStatus,
      this.serviceResponseStatus = UserProfileUpdateResponseStatus.unknown});

  @override
  List<Object?> get props => [
        userName,
        phoneNumber,
        email,
        address,
      ];
}
