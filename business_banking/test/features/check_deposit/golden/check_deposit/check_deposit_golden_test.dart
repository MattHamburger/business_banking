import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_bloc.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/check_deposit_presenter.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/check_deposit_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Check Deposit Golden test', (tester) async {
    CheckDepositEntity entity = CheckDepositEntity(toAccounts: ['4444444444', '5555555555', '6666666666']);
    ExampleLocator()
        .repository
        .create<CheckDepositEntity>(entity, (_) {}, deleteIfExists: true);
    final testWidget = MaterialApp(
        home: BlocProvider<CheckDepositBloc>(
            create: (_) => CheckDepositBloc(), child: CheckDepositWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(CheckDepositPresenter), matchesGoldenFile('main.png'));
  });
}