// @dart=2.9
import 'package:business_banking/features/statement/api/statement_response_service_response_model.dart';
import 'package:business_banking/features/statement/api/statement_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StatementService service;

  // Registers a function to be run before tests. This function will be called before each test is run.
  setUp(() {
    service = StatementService();
  });

  group('Statement Service Test', () {
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

    test('should perform a GET request', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.isRight, isTrue);
    });

    test(
        'StatementService should return StatementListServiceResponseModel when the response is success',
        () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.fold((_) {}, (m) => m),
          StatementServiceResponseModel.fromJson(tJsonResponse));
    });
  });
}
