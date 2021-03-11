import 'package:business_banking/features/investment_detail/api/investment_detail_response_model.dart';
import 'package:business_banking/features/investment_detail/api/investment_detail_service.dart';
import 'package:test/test.dart';

void main() {
  InvestmentDetailService service;

  setUp(() {
    service = InvestmentDetailService();
  });

  group('Investment Detail Service ', () {
    final tJsonResponse = {
      "accountBalance": 166996.50,
      "totalGainValue": -6557.00,
      "totalGainPercent": -26.07,
      "investments": [
        {
          "symbol": "CRSP",
          "dayGainValue": 76.00,
          "dayGainPercent": 0.33,
          "price": 114.00,
          "marketValue": 22800.00,
          "count": 200
        },
        {
          "symbol": "TXG",
          "dayGainValue": -4347.00,
          "dayGainPercent": -9.31,
          "price": 114.00,
          "marketValue": 42303.00,
          "count": 300
        },
        {
          "symbol": "JMIA",
          "dayGainValue": -1050.00,
          "dayGainPercent": -9.38,
          "price": 34.00,
          "marketValue": 10200.00,
          "count": 300
        },
        {
          "symbol": "BABA",
          "dayGainValue": -360.00,
          "dayGainPercent": -3.08,
          "price": 226.69,
          "marketValue": 11334.5,
          "count": 50
        },
        {
          "symbol": "FCEL",
          "dayGainValue": -172.00,
          "dayGainPercent": -3.3,
          "price": 12.8,
          "marketValue": 5120.00,
          "count": 400
        },
        {
          "symbol": "AAPL",
          "dayGainValue": -253.00,
          "dayGainPercent": -5.2,
          "price": 116.84,
          "marketValue": 5842.00,
          "count": 50
        },
        {
          "symbol": "TSLA",
          "dayGainValue": -699.00,
          "dayGainPercent": -5.84,
          "price": 567.00,
          "marketValue": 11340.00,
          "count": 20
        },
        {
          "symbol": "PLUG",
          "dayGainValue": -476.00,
          "dayGainPercent": -3.03,
          "price": 38.9,
          "marketValue": 15560.00,
          "count": 400
        },
        {
          "symbol": "NNDM",
          "dayGainValue": 680.00,
          "dayGainPercent": 4.47,
          "price": 8.13,
          "marketValue": 16260.00,
          "count": 2000
        },
        {
          "symbol": "COTY",
          "dayGainValue": 120.00,
          "dayGainPercent": 0.51,
          "price": 7.85,
          "marketValue": 23550.00,
          "count": 3000
        },
        {
          "symbol": "SPCE",
          "dayGainValue": -76.00,
          "dayGainPercent": 2.78,
          "price": 26.87,
          "marketValue": 2687.00,
          "count": 100
        }
      ]
    };

    test('should perform a GET request', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.isRight, isTrue);
    });

    test('should return json obj when the response is success', () async {
      final eitherResponce = await service.request();

      expect(eitherResponce.fold((_) {}, (m) => m),
          InvestmentDetailServiceResponseModel.fromJson(tJsonResponse));
    });
  });
}
