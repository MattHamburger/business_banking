import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_request_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_response_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CheckDepositToAccountServiceTest success', () async {
    final service = CheckDepositToAccountService();
    final CheckDepositToAccountsRequestModel model = new CheckDepositToAccountsRequestModel(fromAccount: '1111111111');
    final eitherResponse = await service.request(requestModel: model);

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        CheckDepositToAccountResponseModel.fromJson({
          "toAccounts": ["4444444444", "5555555555", "6666666666"]
        }));
  });
}