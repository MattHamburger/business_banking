import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_presenter.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transfer Funds Golden test', (tester) async {
    TransferFundsEntity entity = TransferFundsEntity(fromAccounts: ['1111111111', '2222222222', '3333333333']);
    ExampleLocator()
        .repository
        .create<TransferFundsEntity>(entity, (_) {}, deleteIfExists: true);
    final testWidget = MaterialApp(
        home: BlocProvider<TransferFundsBloc>(
            create: (_) => TransferFundsBloc(), child: TransferFundsWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    await expectLater(find.byType(TransferFundsPresenter), matchesGoldenFile('main.png'));
  });
}