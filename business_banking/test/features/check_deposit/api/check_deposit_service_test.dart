import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_request_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_response_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_service.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CheckDepositServiceTest success', () async {
    final service = CheckDepositService();
    final requestModel = new CheckDepositRequestModel(toAccount: '5555555555', amount: "1", date: DateTime.now());
    final eitherResponse = await service.request(requestModel: requestModel);

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        CheckDepositResponseModel.fromJson({"confirmation" : "123456789"})
    );
  });
}