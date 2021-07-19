// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersViewModel', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        const offers = <String>['offers'];

        // Test default values.
        var useCase = OffersViewModel(offers: offers);
        expect(useCase, isA<OffersViewModel>());
        expect(useCase.offers, offers);
        expect(useCase.serviceResponseStatus, ServiceResponseStatus.unknown);
        expect(useCase.props, [offers, useCase.serviceResponseStatus]);

        useCase = OffersViewModel(
          offers: offers,
          serviceResponseStatus: ServiceResponseStatus.succeed,
        );
        expect(useCase, isA<OffersViewModel>());
        expect(useCase.offers, offers);
        expect(useCase.serviceResponseStatus, ServiceResponseStatus.succeed);
        expect(useCase.props, [offers, useCase.serviceResponseStatus]);
      });
    });
  });
}
