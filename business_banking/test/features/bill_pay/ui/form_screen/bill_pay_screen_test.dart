// @dart = 2.9
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/form_screen/bill_pay_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/form_screen/bill_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPresenterAction extends Mock
    implements BillPayPresenterActions {}

void main() {
  MaterialApp testWidgetSucceed;
  MaterialApp testWidgetFailed;
  MaterialApp testWidgetPaySuccess;
  MaterialApp testWidgetPayFailed;
  BillPayViewModel billPayViewModelSucceed;
  BillPayViewModel billPayViewModelFailed;
  BillPayViewModel billPayViewModelPaySuccess;
  BillPayViewModel billPayViewModelPayFailed;
  MockPresenterAction mockPresenterAction;
  List<Bill> allBills;

  setUp(() {
    allBills = [
      Bill.fromJson({
        "id": 123,
        "payee": "AEP",
        "memo": "Electric bill",
        "amount": 216.88,
        "due": 1622793600000
      }),
      Bill.fromJson({
        "id": 124,
        "payee": "City of Columbus",
        "memo": "Water bill",
        "amount": 59.53,
        "due": 1620039600000
      }),
      Bill.fromJson({
        "id": 125,
        "payee": "City of Columbus",
        "memo": "Gas bill",
        "amount": 32,
        "due": 1621422000000
      }),
      Bill.fromJson({
        "id": 126,
        "payee": "Coinbase",
        "memo": "Monthly Bitcoin splurging",
        "amount": 14228.27,
        "due": 1621753200000
      })
    ];
    billPayViewModelSucceed = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: 0,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.none,
        referenceNumber: '');

    billPayViewModelFailed = BillPayViewModel(
        allBills: [],
        selectedBillIndex: -1,
        serviceRequestStatus: ServiceRequestStatus.failed,
        payStatus: PayBillStatus.none,
        referenceNumber: '');

    billPayViewModelPaySuccess = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: 0,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.success,
        referenceNumber: '');

    billPayViewModelPayFailed = BillPayViewModel(
        allBills: allBills,
        selectedBillIndex: 0,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: PayBillStatus.failed,
        referenceNumber: '');

    mockPresenterAction = MockPresenterAction();

    testWidgetSucceed = MaterialApp(
      home: BillPayScreen(
          viewModel: billPayViewModelSucceed,
          presenterActions: mockPresenterAction),
    );

    testWidgetFailed = MaterialApp(
      home: BillPayScreen(
          viewModel: billPayViewModelFailed,
          presenterActions: mockPresenterAction),
    );

    testWidgetPaySuccess = MaterialApp(
      home: BillPayScreen(
          viewModel: billPayViewModelPaySuccess,
          presenterActions: mockPresenterAction),
    );

    testWidgetPayFailed = MaterialApp(
      home: BillPayScreen(
          viewModel: billPayViewModelPayFailed,
          presenterActions: mockPresenterAction),
    );
  });

  tearDown(() {
    billPayViewModelSucceed = null;
    billPayViewModelFailed = null;
    billPayViewModelPaySuccess = null;
    billPayViewModelPayFailed = null;
    mockPresenterAction = null;
  });
  group('Bill Pay Screen', () {
    testWidgets('should show the screen', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayScreen);
      expect(widgetType, findsOneWidget);
    });

    testWidgets('should show Bill Pay screen details', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      // Title
      expect(find.text('Pay a bill'), findsOneWidget);

      // Withdrawal notice
      expect(
          find.text(
              '''The amount due will be withdrawn from your primary billing account.'''),
          findsOneWidget);
    });

    testWidgets('should call navigate to previous page presenter action',
            (tester) async {
          await tester.pumpWidget(testWidgetSucceed);
          await tester.pump(Duration(milliseconds: 500));

          var widget = find.byKey(Key('Bill-Pay-Back-Button'));
          expect(widget, findsOneWidget);
          await tester.tap(widget);
          verify(mockPresenterAction.popNavigationListener(any)).called(1);
        });

    testWidgets('should call pick bill presenter action',
            (tester) async {
          await tester.pumpWidget(testWidgetSucceed);
          await tester.pump(Duration(milliseconds: 500));

          var widget = find.text('AEP'); //the selected bill
          expect(widget, findsOneWidget);
          await tester.tap(widget);
          verify(mockPresenterAction.onBillSelectedListener(any)).called(1);
          var widget2 = find.text('Water bill: \$59.53');
          expect(widget2, findsOneWidget);
          await tester.tap(widget2);
          verify(mockPresenterAction.onBillSelectedListener(any)).called(1);
        });
    testWidgets('should call confirm action presenter action', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);

      await tester.pump();

      var widget = find.byKey(Key('Bill-Pay-Confirm-Button'));

      expect(widget, findsOneWidget);
      await tester.tap(widget);
      verify(mockPresenterAction.onTapConfirmBtn(any, any)).called(1);
    });

    testWidgets(
        'should show all bills', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);

      var billTitle1 = find.text('AEP');
      expect(billTitle1, findsOneWidget);
      var billAmount1 = find.text('Electric bill: \$216.88');
      expect(billAmount1, findsOneWidget);
      var overdue1 = DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(1622793600000));
      if (overdue1) {
        var billDue1 = find.text('OVERDUE: June 4th at 4:00 AM');
        expect(billDue1, findsOneWidget);
      } else {
        var billDue1 = find.text('Due: June 4th at 4:00 AM');
        expect(billDue1, findsOneWidget);
      }

      var billTitle2 = find.text('City of Columbus');
      expect(billTitle2, findsNWidgets(2));
      var billAmount2 = find.text('Water bill: \$59.53');
      expect(billAmount2, findsOneWidget);
      var overdue2 = DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(1620039600000));
      if (overdue2) {
        var billDue2 = find.text('OVERDUE: May 3rd at 7:00 AM');
        expect(billDue2, findsOneWidget);
      } else {
        var billDue2 = find.text('Due: May 3rd at 7:00 AM');
        expect(billDue2, findsOneWidget);
      }

      //can't find title by text since it's the same as last bill
      var billAmount3 = find.text('Gas bill: \$32.00');
      expect(billAmount3, findsOneWidget);
      var overdue3 = DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(1621422000000));
      if (overdue3) {
        var billDue3 = find.text('OVERDUE: May 19th at 7:00 AM');
        expect(billDue3, findsOneWidget);
      } else {
        var billDue3 = find.text('Due: May 19th at 7:00 AM');
        expect(billDue3, findsOneWidget);
      }

      await tester.drag(
          find.byKey(Key('Bill-Pay-Bill-List')), const Offset(0.0, -300));

      await tester.pump();

      var billTitle4 = find.text('Coinbase');
      expect(billTitle4, findsOneWidget);
      var billAmount4 = find.text('Monthly Bitcoin splurging: \$14228.27');
      expect(billAmount4, findsOneWidget);
      var overdue4 = DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(1621753200000));
      if (overdue4) {
        var billDue4 = find.text('OVERDUE: May 23rd at 3:00 AM');
        expect(billDue4, findsOneWidget);
      } else {
        var billDue4 = find.text('Due: May 23rd at 3:00 AM');
        expect(billDue4, findsOneWidget);
      }
    });

  });
}
