import 'package:equatable/equatable.dart';

abstract class UpdateUserProfileEvent extends Equatable {}

class UpdatePhoneNumberRequestEvent extends UpdateUserProfileEvent {
  final String phoneNumber;

  UpdatePhoneNumberRequestEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
  @override
  bool get stringify => true;
}

class UpdateEmailRequestEvent extends UpdateUserProfileEvent {
  final String email;

  UpdateEmailRequestEvent(this.email);

  @override
  List<Object?> get props => [email];
  @override
  bool get stringify => true;
}

class UpdateAddressRequestEvent extends UpdateUserProfileEvent {
  final String address;

  UpdateAddressRequestEvent(this.address);

  @override
  List<Object?> get props => [address];
  @override
  bool get stringify => true;
}
