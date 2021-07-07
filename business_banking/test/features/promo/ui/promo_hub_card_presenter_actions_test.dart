// @dart=2.9

import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter_actions.dart';
import 'package:clean_framework/clean_framework.dart';
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

  PromoHubCardViewModel promoHubCardViewModel = PromoHubCardViewModel(
      income: '',
      phone: '',
      phoneFieldStatus: 'Enter valid phone number.',
      incomeFieldStatus: 'Enter valid income value.',
      icon: '',
      serviceResponseStatus: PromoServiceResponseStatus.failed);

  testWidgets('Error dialog shown on response failure', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OnTapButton(
        id: 'errorDialog',
        onTap: (context) {
          presenter.buildScreen(context, PromoBloc(), promoHubCardViewModel);
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

  testWidgets('Verify error dialog when user input is Invalid',
      (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: OnTapButton(
        id: 'errorDialog',
        onTap: (context) {
          actions.onGetOffersTap(context, phone: '', income: '');
        },
      ),
      navigatorObservers: [mockObserver],
    ));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text('Incorrect input'), findsOneWidget);
    expect(find.text('Correct your info'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    verify(mockObserver.didPop(any, any));
    expect(find.text('Incorrect input'), findsNothing);
    expect(find.text('Correct your info'), findsNothing);
    expect(find.text('OK'), findsNothing);
  });

  testWidgets('Verify navigation to promo catalog screen',
      (WidgetTester tester) async {

    Widget buildWidget(
        {String initialRoute = '/',
        CFRouteGenerator generator,
        void Function(CFRoutePage) onUpdate}) {
      return CFRouterScope(
          initialRoute: initialRoute,
          routeGenerator: generator,
          builder: (context) {
            return MaterialApp.router(
              routerDelegate: CFRouterDelegate(context, onUpdate: onUpdate),
              routeInformationParser: CFRouteInformationParser(),
            );
          });
    }

    await tester.pumpWidget(buildWidget(generator: (name) {
      switch (name) {
        case '/':
          return OnTapButton(
            id: 'PromoCatalogScreen',
            onTap: (context) => actions.onGetOffersTap(
              context,
              phone: '3103103300',
              income: '100000',
            ),
          );
        default:
          return Container();
      }
    }));
    expect(navElement.router.previousPage?.name, isNull);
    expect(navElement.router.currentPage.name, '/');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    blocMock.promoHubCardViewModelPipe.receive.listen((event) {
      expect(event, isA<PromoHubCardViewModel>());
    });
    expect(navElement.router.currentPage.name, '/promoCatalog');
  });

  test('Verify event type dispatch on UpdateIncomeEvent receipt', () async {
    actions.onUpdateIncome('200');

    blocMock.promoHubCardViewModelPipe.receive.listen((event) {
      expect(event, isA<PromoHubCardViewModel>());
    });
  });

  test('Verify event type dispatch on UpdatePhoneEvent receipt', () async {
    actions.onUpdatePhone('4884888888');

    blocMock.promoHubCardViewModelPipe.receive.listen((event) {
      expect(event, isA<PromoHubCardViewModel>());
    });
  });
}
