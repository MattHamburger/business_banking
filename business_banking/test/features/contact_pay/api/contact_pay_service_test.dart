import 'package:business_banking/features/contact_pay/api/contact_pay_service.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_mocks.dart';

void main() {
  test('ContactPayService service success', () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
      "confirmationId": "1"
    }''');

    final service = ContactPayService();

    final requestData =
        ContactPayRequestModel(paymentAmount: 500, contactEmail: "bob");

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m),
        ContactPayResponseModel.fromJson({"confirmationId": "1"}));
  });

  test('ContactPayService service bad request, no request data', () async {
    testRestAPISetup();

    final service = ContactPayService();

    final requestData =
        ContactPayRequestModel(paymentAmount: 0, contactEmail: "");

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isLeft, isTrue);
  });

  test('ContactPayService service failure due to recipient not existing',
      () async {
    testRestAPISetup(type: RestResponseType.success, content: '''{
      "errorCode": 200
    }''');
    final service = ContactPayService();

    final requestData = ContactPayRequestModel(
        paymentAmount: 438.65, contactEmail: "johndoe@guy.com");

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, true);
    expect(eitherResponse.fold((_) {}, (m) => m),
        ContactPayResponseModel.fromJson({"errorCode": 200}));
  });
}
