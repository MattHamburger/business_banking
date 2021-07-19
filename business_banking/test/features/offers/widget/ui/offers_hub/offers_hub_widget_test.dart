// @dart=2.9
import 'package:business_banking/features/offers/ui/offers_hub/offers_hub_presenter.dart';
import 'package:business_banking/features/offers/ui/offers_hub/offers_hub_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersHubWidget', () {
    testWidgets(
      "should add an instance of 'BlocProvider<OffersBloc>' to the widget tree",
      (tester) async {
        final testWidget = MaterialApp(home: OffersHubWidget());

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(
            find.byKey(const Key('OffersHub-bloc-provider')), findsOneWidget);
      },
    );

    testWidgets(
      "should add an 'OffersHubPresenter' instance to the widget tree",
      (tester) async {
        final testWidget = MaterialApp(home: OffersHubWidget());

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(OffersHubPresenter), findsOneWidget);
      },
    );
  });
}
