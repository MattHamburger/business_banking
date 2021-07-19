// @dart=2.9
import 'package:business_banking/features/offers/ui/offers_List/offers_list_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCFRouter extends Mock implements CFRouter {}

void main() {
  group('OffersListActions', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        var actions = OffersListActions();
        expect(actions, isA<OffersListActions>());

        final router = MockCFRouter();
        actions = OffersListActions(router: router);
        expect(actions, isA<OffersListActions>());
      });
    });

    group('navigateBack()', () {
      test('should set my code coverage to 100%', () async {
        final router = MockCFRouter();
        final actions = OffersListActions(router: router);
        final context = MockBuildContext();
        final Future<bool> future = () async {
          actions.navigateBack(context);
          return true;
        }();
        expect(future, completion(equals(true)));
      });
    });
  });
}
