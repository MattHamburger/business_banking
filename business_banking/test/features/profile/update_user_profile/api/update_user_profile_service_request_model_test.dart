import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final viewModel = UpdateUserProfileServiceRequestModel(
    address: '123 Main St NewYork Ny',
    userName: 'user123',
    email: 'test@test.com',
    phoneNumber: '7181231234',
  );
  test('UpdateUserProfileServiceRequestModel initialize', () async {
    expect(viewModel.address, '123 Main St NewYork Ny');
    expect(viewModel.userName, 'user123');
    expect(viewModel.email, 'test@test.com');
    expect(viewModel.phoneNumber, '7181231234');
  });

  test('UpdateUserProfileServiceRequestModel toJson', () async {
    expect(viewModel.toJson(), {
      'address': '123 Main St NewYork Ny',
      'userName': 'user123',
      'email': 'test@test.com',
      'phoneNumber': '7181231234',
    });
  });
  test('UpdateUserProfileServiceRequestModel toJson with empty objects',
      () async {
    final viewModel = UpdateUserProfileServiceRequestModel(
      address: '',
      userName: '',
      email: '',
      phoneNumber: '',
    );

    expect(viewModel.toJson(), {
      'address': '',
      'userName': '',
      'email': '',
      'phoneNumber': '',
    });
  });
  test('should props match', () async {
    expect(viewModel.props, [
      viewModel.userName,
      viewModel.phoneNumber,
      viewModel.email,
      viewModel.address,
    ]);
  });
}
