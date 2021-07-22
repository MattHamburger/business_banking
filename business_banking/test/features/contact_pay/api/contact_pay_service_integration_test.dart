import 'package:business_banking/features/contact_pay/api/contact_pay_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ContactPayService service success', () async {
    // Can't expect a right value if errorCode is not integrated into your api request/response
    final service = ContactPayService();

    final requestData =
        ContactPayRequestModel(paymentAmount: 500, contactEmail: "bob");

    final eitherResponse = await service.request(
        requestModel:
            requestData); // all services have a request() method which triggers api call

    expect(eitherResponse.fold((_) {}, (m) => m),
        ContactPayResponseModel.fromJson({"confirmationId": "1"}));
  });

  test('ContactPayService service bad request, no request data', () async {
    final service = ContactPayService();

    final requestData =
        ContactPayRequestModel(paymentAmount: 0, contactEmail: "");

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isLeft, isTrue);
  });

  test('ContactPayService service failure due to recipient not existing',
      () async {
    final service = ContactPayService();

    final requestData = ContactPayRequestModel(
        paymentAmount: 438.65, contactEmail: "mandude@guy.com");

    final eitherResponse = await service.request(requestModel: requestData);

    //expect(eitherResponse.isRight, true);
    expect(eitherResponse.fold((_) {}, (m) => m),
        ContactPayResponseModel.fromJson({"errorCode": 200}));
  });
}
