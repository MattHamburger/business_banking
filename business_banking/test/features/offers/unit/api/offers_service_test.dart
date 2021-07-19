// @dart=2.9
import 'package:business_banking/features/offers/api/offers_service.dart';
import 'package:business_banking/features/offers/api/offers_service_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersService', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        final service = OffersService();

        expect(service, isA<OffersService>());
        expect(service.path, 'offers');
      });
    });

    group('parseResponse()', () {
      test('decodes a valid JSON response successfully', () async {
        final service = OffersService();
        final json = <String, dynamic>{
          'offers': <String>[
            'orci dapibus ultrices in iaculis nunc sed augue',
            'lacus viverra vitae congue eu consequat ac felis'
          ]
        };

        OffersServiceResponseModel response = service.parseResponse(json);
        expect(response, isA<OffersServiceResponseModel>());
        expect(response.offers.length, json['offers'].length);
        for (int i = 0; i < response.offers.length; i++) {
          expect(response.offers[i], json['offers'][i]);
        }
      });

      test(
        'returns an empty list of offers if the JSON response is invalid',
        () async {
          final service = OffersService();
          final json = <String, dynamic>{};

          OffersServiceResponseModel response = service.parseResponse(json);
          expect(response, isA<OffersServiceResponseModel>());
        },
      );
    });

    /// Mockoon must be running and initialized with the environment located in
    /// "mockoon/offers_env.json" to run this test successfully (do not
    /// update the value returned for the /offers endpoint).
    test('should return the expected value from the /offers endpoint',
        () async {
      // Value expected from Mockoon based on "mockoon/offers_env.json".
      const expectedJSON = {
        "offers": [
          "orci dapibus ultrices in iaculis nunc sed augue lacus viverra vitae congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas",
          "tincidunt lobortis feugiat vivamus at augue eget arcu dictum varius duis at consectetur lorem donec massa sapien faucibus et molestie ac feugiat sed lectus vestibulum",
          "amet tellus cras adipiscing enim eu turpis egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris ultrices eros in cursus turpis massa tincidunt dui",
          "quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in",
          "risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus"
        ],
      };

      final service = OffersService();
      final eitherResponse = await service.request();

      expect(eitherResponse.isRight, isTrue);
      expect(
        eitherResponse.fold((_) {}, (m) => m),
        OffersServiceResponseModel.fromJson(expectedJSON),
      );
    });
  });
}
