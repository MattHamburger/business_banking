// @dart=2.9
import 'package:business_banking/features/offers/model/offers_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersEntity', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        const errors = <EntityFailure>[GeneralEntityFailure()];
        const offers = <String>['offers'];

        // Test default values.
        var useCase = OffersEntity();
        expect(useCase, isA<OffersEntity>());
        expect(useCase.errors, isEmpty);
        expect(useCase.offers, isEmpty);

        useCase = OffersEntity(errors: errors, offers: offers);
        expect(useCase, isA<OffersEntity>());
        expect(useCase.errors, errors);
        expect(useCase.offers, offers);
      });
    });

    group('merge()', () {
      test("should merge two 'OffersEntity' instances successfully", () async {
        const errors1 = <EntityFailure>[GeneralEntityFailure()];
        const offers1 = <String>['offers #1'];
        const errors2 = <EntityFailure>[NoConnectivityEntityFailure()];
        const offers2 = <String>['offers #2'];

        var initial = OffersEntity(errors: errors1, offers: offers1);
        var toBeMerged = OffersEntity(errors: errors2, offers: offers2);

        expect(initial.merge(), initial);
        expect(
          initial.merge(errors: toBeMerged.errors),
          OffersEntity(
            errors: toBeMerged.errors,
            offers: initial.offers,
          ),
        );
        expect(
          initial.merge(offers: toBeMerged.offers),
          OffersEntity(
            errors: initial.errors,
            offers: toBeMerged.offers,
          ),
        );
        expect(
          initial.merge(errors: toBeMerged.errors, offers: toBeMerged.offers),
          OffersEntity(
            errors: toBeMerged.errors,
            offers: toBeMerged.offers,
          ),
        );
      });
    });
  });
}
