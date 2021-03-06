// @dart=2.9
import 'package:business_banking/features/deposit_check/bloc/deposit_check_bloc.dart';
import 'package:business_banking/features/deposit_check/ui/3rd_request_confirmation/deposit_check_confirm_presenter.dart';
import 'package:business_banking/features/deposit_check/ui/3rd_request_confirmation/deposit_check_confirm_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/deposit_check_bloc_mock.dart';

class MockConfirmPressenterAction extends Mock
    implements DepositCheckConfirmPressenterActions {}

void main() {
  MaterialApp testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<DepositCheckBloc>(
        create: (_) => DepositCheckBlockMock(),
        child: DepositCheckConfirmWidget(),
      ),
    );
  });

  group('Deposit Check Confirm', () {
    testWidgets('should shows the presenter', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(DepositCheckConfirmPresenter);
      expect(widgetType, findsOneWidget);
    });
  });
}
