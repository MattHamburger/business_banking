import 'package:business_banking/features/advertisement/api/ad_service_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdServiceRequestModel initialization', () async {
    final viewModel = AdServiceRequestModel(
      id: 'id01',
    );

    expect(viewModel.id, 'id01');
  });

  test('AdServiceRequestModel toJson constructor', () async {
    final viewModel = AdServiceRequestModel(
      id: 'id01',
    );

    expect(viewModel.toJson(), {"id": 'id01'});
  });
}
