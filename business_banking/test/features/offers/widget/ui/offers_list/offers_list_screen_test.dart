// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:business_banking/features/offers/ui/offers_List/offers_list_actions.dart';
import 'package:business_banking/features/offers/ui/offers_List/offers_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockOffersListActions extends Mock implements OffersListActions {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OffersListScreen', () {
    final offers = ['offer #1', 'offer #2'];
    final mockActions = MockOffersListActions();

    tearDown(() {
      reset(mockActions);
    });

    group('with a valid OffersViewModel', () {
      MaterialApp offersHubScreen;
      final viewModel = OffersViewModel(
        offers: offers,
        serviceResponseStatus: ServiceResponseStatus.succeed,
      );

      setUp(() {
        offersHubScreen = MaterialApp(
          home: OffersListScreen(viewModel: viewModel, actions: mockActions),
        );
      });

      tearDown(() {
        offersHubScreen = null;
      });

      testWidgets('should display the Offers List widget', (tester) async {
        await tester.pumpWidget(offersHubScreen);
        await tester.pumpAndSettle();

        expect(
          find.byKey(const Key('OffersList-appbar-back-button')),
          findsOneWidget,
        );
        expect(
          find.byKey(const Key('OffersList-appbar-title')),
          findsOneWidget,
        );

        expect(find.byKey(const Key('OffersList-success')), findsOneWidget);
        expect(
          find.byKey(const Key('OffersList-failure')),
          findsNothing,
        );

        for (int i = 0; i < offers.length; i++) {
          expect(
            find.byKey(Key('OffersList-success-offer-title-${i + 1}')),
            findsOneWidget,
          );
          expect(
            find.byKey(Key('OffersList-success-offer-divider-${i + 1}')),
            findsOneWidget,
          );
          expect(
            find.byKey(Key('OffersList-success-offer-description-${i + 1}')),
            findsOneWidget,
          );
          expect(
            find.byKey(Key('OffersList-success-offer-disclaimer-${i + 1}')),
            findsOneWidget,
          );
        }
      });

      testWidgets(
        'should navigate back to the Hub page when tapping on the '
        'app-bar back-button',
        (tester) async {
          await tester.pumpWidget(offersHubScreen);
          await tester.pumpAndSettle();

          var backButton = find.byKey(
            const Key('OffersList-appbar-back-button'),
          );
          expect(backButton, findsOneWidget);
          await tester.tap(backButton);
          verify(mockActions.navigateBack(any)).called(1);
        },
      );
    });

    group('with an erroneous OffersViewModel', () {
      MaterialApp offersListScreen;
      final viewModel = OffersViewModel(
        offers: offers,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );

      setUp(() {
        offersListScreen = MaterialApp(
          home: OffersListScreen(viewModel: viewModel, actions: mockActions),
        );
      });

      tearDown(() {
        offersListScreen = null;
      });

      testWidgets(
        'should display the Failure Card widget',
        (tester) async {
          await tester.pumpWidget(offersListScreen);
          await tester.pumpAndSettle();

          expect(
            find.byKey(const Key('OffersList-appbar-back-button')),
            findsOneWidget,
          );
          expect(
            find.byKey(const Key('OffersList-appbar-title')),
            findsOneWidget,
          );

          expect(find.byKey(const Key('OffersList-success')), findsNothing);
          expect(
            find.byKey(const Key('OffersList-failure')),
            findsOneWidget,
          );

          expect(
            find.byKey(const Key('OffersList-failure-icon')),
            findsOneWidget,
          );
          expect(
            find.byKey(const Key('OffersList-failure-title')),
            findsOneWidget,
          );
          expect(
            find.byKey(const Key('OffersList-failure-divider')),
            findsOneWidget,
          );
          expect(
            find.byKey(const Key('OffersList-failure-description')),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should navigate back to the Hub page when tapping on the '
        'app-bar back-button',
        (tester) async {
          await tester.pumpWidget(offersListScreen);
          await tester.pumpAndSettle();

          var backButton = find.byKey(
            const Key('OffersList-appbar-back-button'),
          );
          expect(backButton, findsOneWidget);
          await tester.tap(backButton);
          verify(mockActions.navigateBack(any)).called(1);
        },
      );

      testWidgets(
        'should navigate back to the Hub page when tapping on the Failure Card '
        'widget',
        (tester) async {
          await tester.pumpWidget(offersListScreen);
          await tester.pumpAndSettle();

          var failureCard = find.byKey(
            const Key('OffersList-failure'),
          );
          expect(failureCard, findsOneWidget);
          await tester.tap(failureCard);
          verify(mockActions.navigateBack(any)).called(1);
        },
      );
    });
  });
}
