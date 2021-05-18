// @dart=2.9
import 'package:business_banking/features/statement/api/account_info_list_service.dart';
import 'package:business_banking/features/statement/api/account_info_list_service_response_model.dart';
import 'package:test/test.dart';

void main() {
  AccountInfoListService service;

  // Registers a function to be run before tests. This function will be called before each test is run.
  setUp(() {
    service = AccountInfoListService();
  });

  group('AccountInfoList Service Test', () {
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

    test('should perform a GET request', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.isRight, isTrue);
    });

    test(
        'AccountInfoListService should return AccountInfoListServiceResponseModel when the response is success',
        () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.fold((_) {}, (m) => m),
          AccountInfoListServiceResponseModel.fromJson(tJsonResponse));
    });
  });
}
