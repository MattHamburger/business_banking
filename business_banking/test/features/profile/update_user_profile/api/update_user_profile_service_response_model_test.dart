import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UpdateUserProfileServiceResponseModel initialize', () async {
    final viewModel = UpdateUserProfileServiceResponseModel.fromJson({
      'isProfileUpdated': false,
    });

    expect(viewModel.isProfileUpdated, false);
    expect(viewModel.props, [
      viewModel.isProfileUpdated,
    ]);
  });

  test('UpdateUserProfileServiceResponseModel profile update success',
      () async {
    final viewModel = UpdateUserProfileServiceResponseModel.fromJson({
      'isProfileUpdated': true,
    });

    expect(viewModel.isProfileUpdated, true);
    expect(viewModel.props, [
      viewModel.isProfileUpdated,
    ]);
  });
}
