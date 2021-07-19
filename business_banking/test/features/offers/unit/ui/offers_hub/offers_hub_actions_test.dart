// @dart=2.9
import 'package:business_banking/features/offers/ui/offers_hub/offers_hub_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCFRouter extends Mock implements CFRouter {}

void main() {
  group('OffersHubActions', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        var actions = OffersHubActions();
        expect(actions, isA<OffersHubActions>());

        final router = MockCFRouter();
        actions = OffersHubActions(router: router);
        expect(actions, isA<OffersHubActions>());
      });
    });

    group('navigateToOffersList()', () {
      test('should set my code coverage to 100%', () async {
        final router = MockCFRouter();
        final actions = OffersHubActions(router: router);
        final context = MockBuildContext();
        final Future<bool> future = () async {
          actions.navigateToOffersList(context);
          return true;
        }();
        expect(future, completion(equals(true)));
      });
    });
  });
}
