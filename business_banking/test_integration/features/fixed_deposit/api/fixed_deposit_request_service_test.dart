import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_request_model.dart';
import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_response_model.dart';
import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FixedDepositService success', () async {
    final service = FixedDepositRequestService();

    final requestData = FixedDepositRequestRequestModel(
      depositAmount: 0.00,
      tenure: 0,
      interestRate: 0.00,
      email: 'abhishek_khanal29@yahoo.com',
      nomineeName: '',
      remarks: 'placeholder',
    );

    final eitherResponse = await service.request(requestModel: requestData);

    expect(eitherResponse.isRight, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m),
        FixedDepositRequestResponseModel.fromJson({"success": true}));
  });

  test('FixedDepositService service bad request, no request data', () async {
    final service = FixedDepositRequestService();

    final eitherResponse = await service.request();

    expect(eitherResponse.isLeft, isTrue);
  });

  test('FixedDepositService service failure due to invalid data', () async {
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

    expect(eitherResponse.isLeft, isTrue);

    expect(eitherResponse.fold((_) {}, (m) => m),
        FixedDepositRequestResponseModel.fromJson({"errorCode": 403}));
  });
}
