// @dart=2.9
import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:business_banking/features/new_cards/api/new_cards_service.dart';
import 'package:test/test.dart';

void main() {
  NewCardsService service;

  // Registers a function to be run before tests. This function will be called before each test is run.
  setUp(() {
    service = NewCardsService();
  });

  group('NewCardsService Test', () {
    final tJsonResponse = {
      "cards": [
        {
          "number": "7948 8504 9458 8550",
          "holder": "User T",
          "expiry": "9/27",
          "card_id": 1
        },
        {
          "number": "7948 8504 9458 8551",
          "holder": "User K",
          "expiry": "9/27",
          "card_id": 2
        },
        {
          "number": "7948 8504 9458 8548",
          "holder": "User F",
          "expiry": "9/27",
          "card_id": 3
        },
        {
          "number": "7948 8504 9458 8547",
          "holder": "User L",
          "expiry": "9/27",
          "card_id": 4
        },
        {
          "number": "7948 8504 9458 8546",
          "holder": "User M",
          "expiry": "9/27",
          "card_id": 5
        },
        {
          "number": "7948 8504 9458 8545",
          "holder": "User U",
          "expiry": "9/27",
          "card_id": 6
        },
        {
          "number": "7948 8504 9458 8544",
          "holder": "User Q",
          "expiry": "9/27",
          "card_id": 7
        }
      ]
    };

    test('should perform a GET request', () async {
      final newCardsServiceResponse = await service.request();

      expect(newCardsServiceResponse.isRight, isTrue);
    });

    test(
        'should NewCardsService return NewCardsResponseModel when the response is success',
        () async {
      final newCardsServiceResponse = await service.request();

      expect(newCardsServiceResponse.fold((_) {}, (m) => m),
          NewCardsResponseModel.fromJson(tJsonResponse));
    });
  });
}
