import 'package:business_banking/features/cashback/api/cashback_enrollment_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CashbackEnrollmentService service success', () async {
    final service = CashbackEnrollmentService();

    final requestData = CashbackEnrollmentRequestModel(
      city: 'New York',
      address: '100 Central',
      type: CashbackEnrollmentType.discounts,
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m),
        CashbackEnrollmentResponseModel.fromJson({"confirmationId": "12345"}));
  });

  test('CashbackEnrollmentService service bad request, no request data',
      () async {
    final service = CashbackEnrollmentService();

    final eitherResponse = await service.request();

    expect(eitherResponse.isLeft, isTrue);
  });

  test('CashbackEnrollmentService service failure due to user is not eligible',
      () async {
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
