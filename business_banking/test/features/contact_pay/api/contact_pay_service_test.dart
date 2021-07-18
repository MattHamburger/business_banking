import 'package:business_banking/features/contact_pay/api/contact_pay_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ContactPayService service success test', () async {
    // Make this work - probably a mockoon issue (What fixed Ben's was not the issue for me)
    final service = ContactPayService();

    final requestData = ContactPayRequestModel(
        paymentAmount: "500", paymentContactEmail: "guy@mail.com");

    final eitherResponse = await service.request(
        requestModel:
            requestData); // all services have a request() method which triggers api call

    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m),
        ContactPayResponseModel.fromJson({"confirmationId": "11112222"}));
  });

  test('ContactPayService service success failure', () async {
    final service = ContactPayService();

    final eitherResponse = await service.request();

    expect(eitherResponse.isLeft, isTrue);
  });

  test('ContactPayService service failure due to recipient not existing',
      () async {});
}
