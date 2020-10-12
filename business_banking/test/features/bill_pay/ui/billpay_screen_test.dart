import 'package:business_banking/features/billpay/bloc/billpay_bloc.dart';
import 'package:business_banking/features/billpay/ui/billpay_presenter.dart';
import 'package:business_banking/features/billpay/ui/billpay_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bill pay widget Test', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<BillPayBloc>(
        create: (_) => BillPayBloc(),
        child: BillPayFeatureWidget(),
      ),
    );
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(BillPayPresenter), findsOneWidget);
  });

  testWidgets('Find Bill Pay Button, The TextField for Amount', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<BillPayBloc>(
        create: (_) => BillPayBloc(),
        child: BillPayPresenter(),
      ),
    );
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byKey(Key('PayBtn')), findsOneWidget);
    expect(find.byKey(Key('bill_pay_amount_tf_key')), findsOneWidget);
    expect(find.byKey(Key('WelcomeTextKey')), findsOneWidget);
  });
}
