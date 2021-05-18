// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/api/account_info_list_service_response_model.dart';
import 'package:business_banking/features/statement/bloc/hub_cards/account_info_struct_list_service_adapter.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_entity.dart';
import 'package:test/test.dart';

void main() {
  group('AccountInfoList Service Adapter Test', () {
    final tEntity = StatementCardEntity(accountInfoStructs: [
      AccountInfoStruct(
          accountNickname: 'Checking Account (...6917)',
          accountNumber: '1234567890126917',
          availableBalance: 481.84,
          depositLimit: 4500.0),
      AccountInfoStruct(
          accountNickname: 'Wells Fargo (6537)',
          accountNumber: '12345678932246917',
          availableBalance: 1441.84,
          depositLimit: 4500.00),
    ]);

    final tJsonResponse = {
      "accounts": [
        {
          "accountNumber": "1234567890126917",
          "availableBalance": 481.84,
          "depositLimit": 4500.00,
          "accountNickname": "Checking Account (...6917)"
        },
        {
          "depositLimit": 4500.00,
          "accountNumber": "12345678932246917",
          "availableBalance": 1441.84,
          "accountNickname": "Wells Fargo (6537)"
        }
      ]
    };

    test('should received a json responce and return StatementCard entity',
        () async {
      final entity = AccountInfoListServiceAdapter().createEntity(
          StatementCardEntity(),
          AccountInfoListServiceResponseModel.fromJson(tJsonResponse));
      expect(entity, tEntity);
    });
  });
}
