// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:business_banking/features/offers/ui/offers_hub/offers_hub_actions.dart';
import 'package:business_banking/features/offers/ui/offers_hub/offers_hub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockOffersHubActions extends Mock implements OffersHubActions {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OffersHubScreen', () {
    final offers = ['offer #1', 'offer #2'];
    final mockActions = MockOffersHubActions();

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
          home: OffersHubScreen(viewModel: viewModel, actions: mockActions),
        );
      });

      tearDown(() {
        offersHubScreen = null;
      });

      testWidgets('should display the Offers Header widget', (tester) async {
        await tester.pumpWidget(offersHubScreen);
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('OffersHub-success')), findsOneWidget);
        expect(
          find.byKey(const Key('OffersHub-failure')),
          findsNothing,
        );
        expect(
          find.byKey(const Key('OffersHub-success-title')),
          findsOneWidget,
        );
        expect(
          find.byKey(const Key('OffersHub-success-divider')),
          findsOneWidget,
        );
        expect(
          find.byKey(const Key('OffersHub-success-description')),
          findsOneWidget,
        );
      });

      testWidgets('should navigate to the Offers List page', (tester) async {
        await tester.pumpWidget(offersHubScreen);
        await tester.pumpAndSettle();

        var offerHeaderWidget = find.byKey(const Key('OffersHub-success'));
        expect(offerHeaderWidget, findsOneWidget);
        await tester.tap(offerHeaderWidget);
        verify(mockActions.navigateToOffersList(any)).called(1);
      });
    });

    group('with an erroneous OffersViewModel', () {
      final viewModel = OffersViewModel(
        offers: offers,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );

      testWidgets(
        'should not display the Offers Header widget',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: OffersHubScreen(viewModel: viewModel, actions: mockActions),
            ),
          );
          await tester.pumpAndSettle();

          expect(find.byKey(const Key('OffersHub-success')), findsNothing);
          expect(
            find.byKey(const Key('OffersHub-failure')),
            findsOneWidget,
          );
        },
      );
    });
  });
}
