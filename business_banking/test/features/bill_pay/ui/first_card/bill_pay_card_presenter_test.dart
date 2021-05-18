// @dart=2.9
import 'dart:io';

import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_screen.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_widget.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/bill_pay_bloc_mock.dart';

class MockPresenterActions extends Mock
    implements BillPayCardPresenterActions {
  BillPayBlocMock blocMock;
  BillPayCardViewModel viewModel;
  MockPresenterActions(this.blocMock, this.viewModel);

  @override
  navigateToBillPay(BuildContext context) {
    //would normally navigate
  }
}

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  MockBuildContext mockBuildContext;
  BillPayCardViewModel billPayViewModelSucceed;
  MockPresenterActions mockPresenterActions;
  BillPayCardPresenterActions billPayCardPresenterActions;
  BillPayBlocMock mockBloc;
  MaterialApp testWidget;
  Widget testWidgetRouter;
  MockNavigatorObserver observer;
  BuildContext routeContext;

  setUp(() {
    mockBuildContext = MockBuildContext();

    mockBloc = BillPayBlocMock();

    billPayViewModelSucceed = BillPayCardViewModel(
        billsDue: 4,
        serviceRequestStatus: ServiceRequestStatus.success);

    mockPresenterActions =
         MockPresenterActions(mockBloc, billPayViewModelSucceed);
    billPayCardPresenterActions = BillPayCardPresenterActions(
        mockBloc, billPayViewModelSucceed);

    observer = MockNavigatorObserver();

    testWidget = MaterialApp(
      home: BlocProvider<BillPayBlocMock>(
        create: (_) => BillPayBlocMock(),
        child: BillPayCardWidget(),
      ),
    );
    testWidgetRouter = CFRouterScope(
      routeGenerator: BusinessBankingRouter.generate,
      initialRoute: BusinessBankingRouter.initialRoute,
      builder: (context) => BlocProvider(
        create: (context) {
          routeContext = context;
          return BillPayBloc();
        },
        child: MaterialApp(
          home: BillPayCardScreen(
            viewModel: BillPayCardViewModel(billsDue: 4),
            presenterActions: billPayCardPresenterActions,
          ),
          navigatorObservers: [observer],
          debugShowCheckedModeBanner: false,
        ),
      )
    );
  });

  group('Bill Pay Card', () {
    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayCardPresenter);
      expect(widgetType, findsOneWidget);
    });

    testWidgets(
        'navigateToBillPay should push new route',
        (tester) async {
          await tester.pumpWidget(testWidgetRouter);
          await tester.pump(Duration(milliseconds: 500));
          billPayCardPresenterActions.navigateToBillPay(routeContext);
          verify(observer.didPush(any, any)).called(1);
        });
  });
}
