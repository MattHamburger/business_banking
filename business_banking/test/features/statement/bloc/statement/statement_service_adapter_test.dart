// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/api/statement_response_service_response_model.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_service_adapter.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:test/test.dart';

void main() {
  group('StatementList Service Adapter Test', () {
    final tEntity = StatementEntity(statements: [
      Statement(
          accountInfo: AccountInfoStruct(
              accountNickname: 'HNB Credit Card (6917)',
              accountNumber: '1234567890126917',
              availableBalance: 481.84,
              depositLimit: 4500.0),
          statementActivity: [
            StatementActivity(
                "LYFT RIDE", "04/13/2021 00:00:00", null, 200.00, 1200.00),
            StatementActivity(
                "PAYCHECK", "04/14/2021 00:00:00", null, 400.00, 1600.00)
          ]),
      Statement(
          accountInfo: AccountInfoStruct(
              accountNickname: 'Wells Fargo (6537)',
              accountNumber: '12345678932246917',
              availableBalance: 1441.84,
              depositLimit: 4500.00),
          statementActivity: [
            StatementActivity(
                "UBER RIDE", "04/13/2021 00:00:00", 54.00, null, 95.00),
            StatementActivity(
                "TRANSFER", "04/13/2021 00:00:00", null, 100.00, 195.00)
          ])
    ]);

    final tJsonResponse = {
      "statements": [
        {
          "accountInfo": {
            "depositLimit": 4500.00,
            "accountNumber": "1234567890126917",
            "availableBalance": 481.84,
            "accountNickname": "HNB Credit Card (6917)"
          },
          "statementActivity": [
            {
              "date": "04/13/2021 00:00:00",
              "description": "LYFT RIDE",
              "additions": 200.00,
              "balance": 1200.00
            },
            {
              "date": "04/14/2021 00:00:00",
              "description": "PAYCHECK",
              "additions": 400.00,
              "balance": 1600.00
            }
          ]
        },
        {
          "accountInfo": {
            "depositLimit": 4500.00,
            "accountNumber": "12345678932246917",
            "availableBalance": 1441.84,
            "accountNickname": "Wells Fargo (6537)"
          },
          "statementActivity": [
            {
              "date": "04/13/2021 00:00:00",
              "description": "UBER RIDE",
              "subtractions": 54.00,
              "balance": 95.00
            },
            {
              "date": "04/13/2021 00:00:00",
              "description": "TRANSFER",
              "additions": 100.00,
              "balance": 195.00
            }
          ]
        }
      ]
    };

    test('should received a json responce and return Statement entity',
        () async {
      final entity = StatementServiceAdapter().createEntity(StatementEntity(),
          StatementServiceResponseModel.fromJson(tJsonResponse));
      expect(entity, tEntity);
    });
  });
}
