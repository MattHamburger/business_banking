import 'package:clean_framework/clean_framework.dart';

class UpdateUserProfileEntity extends Entity {
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final bool? isProfileUpdated;

  UpdateUserProfileEntity({
    List<EntityFailure> errors = const [],
    String? userName,
    String? email,
    String? phoneNumber,
    String? address,
    bool? isProfileUpdated,
  })  : userName = userName ?? '',
        email = email ?? '',
        phoneNumber = phoneNumber ?? '',
        address = address ?? '',
        isProfileUpdated = isProfileUpdated ?? false,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        userName!,
        email!,
        phoneNumber!,
        address!,
        isProfileUpdated!,
      ];

  @override
  merge({
    errors,
    String? userName,
    String? email,
    String? phoneNumber,
    String? address,
    bool? isProfileUpdated,
  }) {
    return UpdateUserProfileEntity(
      errors: errors ?? this.errors,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      isProfileUpdated: isProfileUpdated ?? this.isProfileUpdated,
    );
  }
}
