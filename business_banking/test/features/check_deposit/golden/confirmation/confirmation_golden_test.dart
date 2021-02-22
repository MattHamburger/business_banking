import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_presenter.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transfer Funds Golden test', (tester) async {
    TransferFundsEntity entity = TransferFundsEntity(
        fromAccounts: ['1111111111', '2222222222', '3333333333'],
        toAccounts: ['4444444444', '5555555555', '6666666666'],
        fromAccount: '1111111111',
        toAccount: '5555555555',
        id: '123456789',
        date: DateTime.now(),
        amount: '10.0'
    );

    ExampleLocator()
        .repository
        .create<TransferFundsEntity>(entity, (_) {}, deleteIfExists: true);

    final testWidget = MaterialApp(
        home: BlocProvider<TransferFundsBloc>(
            create: (_) => TransferFundsBloc(), child: TransferFundsConfirmationWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(TransferConfirmationPresenter), matchesGoldenFile('main.png'));
  });
}