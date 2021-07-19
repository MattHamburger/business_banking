// @dart=2.9
import 'package:business_banking/features/offers/api/offers_service_response.dart';
import 'package:business_banking/features/offers/bloc/offers_service_adapter.dart';
import 'package:business_banking/features/offers/model/offers_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersServiceAdapter', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        final offersServiceAdapter = OffersServiceAdapter();
        expect(offersServiceAdapter, isA<OffersServiceAdapter>());
      });
    });

    group('createEntity()', () {
      final offersServiceAdapter = OffersServiceAdapter();

      test(
        "should merge an 'OffersEntity' and an 'OffersServiceResponseModel' "
        "successfully",
        () {
          final initialEntity = OffersEntity(offers: <String>['initialEntity']);
          final responseModel = OffersServiceResponseModel(
            offers: <String>['responseModel'],
          );
          final entity = offersServiceAdapter.createEntity(
            initialEntity,
            responseModel,
          );
          expect(entity, isA<OffersEntity>());
          expect(entity.hasErrors(), isFalse);
          expect(entity.offers, responseModel.offers);
        },
      );
    });
  });
}
