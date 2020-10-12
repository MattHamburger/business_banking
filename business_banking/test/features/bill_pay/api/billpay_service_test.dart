import 'package:business_banking/features/billpay/api/billpay_request_model.dart';
import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/api/billpay_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BillPay service success', () async {
    BillPayRequestModel billPayRequestModel = BillPayRequestModel(amount: 100);
    final service = BillPayService();
    final eitherResponse =
        await service.request(requestModel: billPayRequestModel);
    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      BillPayServiceResponseModel.fromJson({'succeeded': true}),
    );
  });

  test('BillPay Service Failure', () async {
    final service = BillPayService();
    final eitherResponse = await service.request();
    expect(eitherResponse.isLeft, isTrue);
    expect(
      eitherResponse.fold((e) {
        return e;
      }, (_) {}),
      isA<GeneralServiceError>(),
    );
  });
}
