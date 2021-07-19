import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class UpdateUserProfileServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? address;

  UpdateUserProfileServiceRequestModel({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }

  @override
  List<Object?> get props => [userName, phoneNumber, email, address];
}
