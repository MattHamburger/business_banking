import 'package:business_banking/features/cashback/api/cashback_enrollment_service.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_mocks.dart';

void main() {
  test('CashbackEnrollmentService service success', () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
      "confirmationId": "12345"
    }''');

    final service = CashbackEnrollmentService();

    final requestData = CashbackEnrollmentRequestModel(
      city: 'New York',
      address: '100 Central',
      type: CashbackEnrollmentType.discounts,
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(
        eitherResponse.fold((_) {
          // do something with the error;
        }, (m) => m),
        CashbackEnrollmentResponseModel.fromJson({"confirmationId": "12345"}));
  });

  test('CashbackEnrollmentService service bad request, no request data',
      () async {
    testRestAPISetup();

    final service = CashbackEnrollmentService();

    final eitherResponse = await service.request();

    expect(eitherResponse.isLeft, isTrue);
  });

  test('CashbackEnrollmentService service failure due to user is not eligible',
      () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
      "errorCode": 300
    }''');
    final service = CashbackEnrollmentService();

    final requestData = CashbackEnrollmentRequestModel(
      city: 'Paris',
      address: '1 Dublin Plaza',
      type: CashbackEnrollmentType.miles,
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m),
        CashbackEnrollmentResponseModel.fromJson({"errorCode": 300}));
  });
}
