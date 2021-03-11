import 'package:business_banking/features/investment/api/investment_service.dart';
import 'package:business_banking/features/investment/api/investment_service_response_model.dart';
import 'package:test/test.dart';

void main() {
  InvestmentService service;

  // Registers a function to be run before tests. This function will be called before each test is run.
  setUp(() {
    service = InvestmentService();
  });

  group('Investment Service Test', () {
    final tJsonResponse = {
      "accountBalance": 1169.02,
      "totalGainValue": -47.16,
      "totalGainPercent": 3.88
    };

    test('should perform a GET request', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.isRight, isTrue);
    });

    test(
        'should InvestmentService return InvestmentServiceResponseModel when the response is success',
        () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.fold((_) {}, (m) => m),
          InvestmentServiceResponseModel.fromJson(tJsonResponse));
    });
  });
}
