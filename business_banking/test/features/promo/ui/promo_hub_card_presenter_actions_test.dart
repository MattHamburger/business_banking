// @dart=2.9

import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../bloc/promo_hub_card_bloc_mock.dart';

Element get navElement => find.byType(Navigator).evaluate().first;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class OnTapButton extends StatelessWidget {
  final String id;
  final void Function(BuildContext) onTap;

  const OnTapButton({Key key, this.id, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Navigate'),
          onPressed: () => onTap?.call(context),
        ),
      ),
    );
  }
}

void main() {
  PromoBlocMock blocMock;
  PromoHubCardPresenterActions actions;
  PromoHubCardPresenter presenter;
  final mockObserver = MockNavigatorObserver();

  setUp(() {
    blocMock = PromoBlocMock();
    actions = PromoHubCardPresenterActions(blocMock);
    presenter = PromoHubCardPresenter();
  });

  tearDown(() {
    blocMock = null;
  });

  PromoHubCardViewModel promoHubCardViewModel =
  PromoHubCardViewModel(
      income: '',
      phone: '',
      phoneFieldStatus: 'Enter valid phone number.',
      incomeFieldStatus: 'Enter valid income value.',
      icon: '',
      serviceResponseStatus: PromoServiceResponseStatus.failed
  );

  testWidgets('Error dialog shown on response failure',
          (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: OnTapButton(
            id: 'errorDialog',
            onTap: (context) {
              presenter.buildScreen(context, PromoBloc(),
                  promoHubCardViewModel);
            },
          ),
          navigatorObservers: [mockObserver],
        ));
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        await tester.pump(Duration(milliseconds: 500));
        expect(find.text('Errors!'), findsOneWidget);
        expect(find.text('Submission failed'), findsOneWidget);
  });

  test(
      'Verify event type dispatch on UpdateIncomeEvent receipt',
          () async {
        actions.onUpdateIncome('200');

        blocMock.promoHubCardViewModelPipe.receive.listen((event) {
          expect(event, isA<PromoHubCardViewModel>());
        });
      });

  test(
      'Verify event type dispatch on UpdatePhoneEvent receipt',
          () async {
        actions.onUpdatePhone('4884888888');

        blocMock.promoHubCardViewModelPipe.receive.listen((event) {
          expect(event, isA<PromoHubCardViewModel>());
        });
      });

}
