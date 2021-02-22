import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransferFundsAccountsServiceTest success', () async {
    final service = TransferFundsAccountsToService();
    final TransferFundsAccountsToRequestModel model = new TransferFundsAccountsToRequestModel(fromAccount: '1111111111');
    final eitherResponse = await service.request(requestModel: model);

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        TransferFundsAccountsToResponseModel.fromJson({
          "toAccounts": ["4444444444", "5555555555", "6666666666"]
        }));
  });
}