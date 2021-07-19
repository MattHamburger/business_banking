// @dart=2.9
import 'package:business_banking/features/offers/ui/offers_List/offers_list_presenter.dart';
import 'package:business_banking/features/offers/ui/offers_List/offers_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersListWidget', () {
    testWidgets(
      "should add an instance of 'BlocProvider<OffersBloc>' to the widget tree",
      (tester) async {
        final testWidget = MaterialApp(home: OffersListWidget());

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(
            find.byKey(const Key('OffersList-bloc-provider')), findsOneWidget);
      },
    );

    testWidgets(
      "should add an 'OffersListPresenter' instance to the widget tree",
      (tester) async {
        final testWidget = MaterialApp(home: OffersListWidget());

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(OffersListPresenter), findsOneWidget);
      },
    );
  });
}
