// @dart = 2.9
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/first_card/bill_pay_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPresenterAction extends Mock
    implements BillPayCardPresenterActions {}

void main() {
  MaterialApp testWidgetSucceed;
  MaterialApp testWidgetFailed;
  MaterialApp testWidgetNoBills;
  BillPayCardViewModel billPayViewModelSucceed;
  BillPayCardViewModel billPayViewModelFailed;
  BillPayCardViewModel billPayViewModelNoBills;
  MockPresenterAction mockPresenterAction;

  setUp(() {
    billPayViewModelSucceed = BillPayCardViewModel(
        billsDue: 4,
        serviceRequestStatus: ServiceRequestStatus.success);

    billPayViewModelFailed = BillPayCardViewModel(
        billsDue: 0,
        serviceRequestStatus: ServiceRequestStatus.failed);

    billPayViewModelNoBills = BillPayCardViewModel(
        billsDue: 0,
        serviceRequestStatus: ServiceRequestStatus.success);

    mockPresenterAction = MockPresenterAction();

    testWidgetSucceed = MaterialApp(
      home: BillPayCardScreen(
          viewModel: billPayViewModelSucceed,
          presenterActions: mockPresenterAction),
    );

    testWidgetFailed = MaterialApp(
      home: BillPayCardScreen(
          viewModel: billPayViewModelFailed,
          presenterActions: mockPresenterAction),
    );

    testWidgetNoBills = MaterialApp(
      home: BillPayCardScreen(
          viewModel: billPayViewModelNoBills,
          presenterActions: mockPresenterAction),
    );
  });

  tearDown(() {
    billPayViewModelSucceed = null;
    billPayViewModelFailed = null;
    billPayViewModelNoBills = null;
    mockPresenterAction = null;
  });
  group('Bill Pay Card', () {
    testWidgets('should show the screen', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(BillPayCardScreen);
      expect(widgetType, findsOneWidget);
    });

    testWidgets(
        'should show bills due on Bill Pay card with succeed response',
            (tester) async {
          await tester.pumpWidget(testWidgetSucceed);
          await tester.pumpAndSettle();

          // Title
          expect(find.byKey(Key('Bill-Pay-Card-Title')), findsOneWidget);
          // Divider
          expect(find.byType(Divider), findsOneWidget);
          // Bills Due
          expect(
              find.text(
                  'You have ${billPayViewModelSucceed.billsDue} bill(s) due'),
              findsOneWidget);
          // Pay Button
          expect(
              find.byKey(Key('Bill-Pay-Card-Button')), findsOneWidget);
        });

    testWidgets('should navigate to pay bill page', (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pump(Duration(milliseconds: 500));

      var widget = find.byKey(Key('Bill-Pay-Card-Button'));
      expect(widget, findsOneWidget);
      await tester.tap(widget);
      verify(mockPresenterAction.navigateToBillPay(any)).called(1);
    });

    testWidgets('should show error card when response failed',
            (tester) async {
          await tester.pumpWidget(testWidgetFailed);
          await tester.pump(Duration(milliseconds: 500));

          // Title
          expect(find.byKey(Key('Bill-Pay-Card-Title')), findsOneWidget);
          // Divider
          expect(find.byType(Divider), findsOneWidget);
          // Error
          expect(find.text('Service is not available! Please try again later.'),
              findsOneWidget);
        });
    testWidgets('should show no bills card if  bills due is zero',
            (tester) async {
          await tester.pumpWidget(testWidgetNoBills);
          await tester.pump(Duration(milliseconds: 500));

          // Title
          expect(find.byKey(Key('Bill-Pay-Card-Title')), findsOneWidget);
          // Divider
          expect(find.byType(Divider), findsOneWidget);
          // Message header
          expect(find.text('You have no bills due'),
              findsOneWidget);
          // Message body
          expect(find.text('Nice! You\'re all caught up.'),
              findsOneWidget);
        });
  });
}
