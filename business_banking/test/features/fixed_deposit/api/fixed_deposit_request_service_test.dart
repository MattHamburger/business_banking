import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_request_model.dart';
import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_response_model.dart';
import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_service.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_mocks.dart';

void main() {
  test('FixedDepositRequestService service success', () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
      "success": true
    }''');

    final service = FixedDepositRequestService();

    final requestData = FixedDepositRequestRequestModel(
      depositAmount: 0.00,
      tenure: 0,
      interestRate: 0.00,
      email: '',
      nomineeName: '',
      remarks: '',
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m),
        FixedDepositRequestResponseModel.fromJson({"success": true}));
  });

  test('FixedDepositRequestService service bad request, no request data',
      () async {
    testRestAPISetup();

    final service = FixedDepositRequestService();

    final eitherResponse = await service.request();

    expect(eitherResponse.isLeft, isTrue);
  });

  test('FixedDepositRequestService service failure due to invalid data',
      () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
    "success":false,
      "errorCode": 403
    }''');
    final service = FixedDepositRequestService();

    final requestData = FixedDepositRequestRequestModel(
      depositAmount: 0.00,
      tenure: 0,
      interestRate: 0.00,
      email: '',
      nomineeName: '',
      remarks: '',
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(
        eitherResponse.fold((_) {}, (m) => m),
        FixedDepositRequestResponseModel.fromJson(
            {"success": false, "errorCode": 403}));
  });
}
