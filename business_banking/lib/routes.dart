import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:flutter/material.dart';

import 'features/deposit_check/ui/2nd_data_entry/deposit_check_widget.dart';
import 'features/deposit_check/ui/3rd_request_confirmation/deposit_check_confirm_widget.dart';
import 'features/bill_pay/ui/form_screen/bill_pay_widget.dart';

abstract class BusinessBankingRouter {
  static const String initialRoute = '/';
  static const String hubRoute = '/hub';
  static const String transferFundsRoute = '/transferFunds';
  static const String transferFundsConfirmRoute = '/transferFundsConfirm';
  static const String accountDetailRoute = '/accountDetail';
  static const String customerDetailRoute = '/customerDetail';
  static const String viewBudgetChartRoute = '/viewBudgetChartRoute';
  static const String investmentDetailRoute = '/investmentDetail';
  static const String creditCardDetailsRoute = '/creditCardDetails';
  static const String creditCardPaymentRequestRoute =
      '/creditCardPaymentRequest';
  static const String creditCardPaymentResponseRoute =
      '/creditCardPaymentResponse';
  static const String depositCheckRoute = '/depositCheck';
  static const String depositCheckConfirmRoute = '/depositCheckConfirm';
  static const String billPayRoute = '/billPay';

  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LoginFeatureWidget();

      case hubRoute:
        return HubScreen();

      case viewBudgetChartRoute:
        return ViewChartWidget();

      case depositCheckRoute:
        return DepositCheckWidget();

      case depositCheckConfirmRoute:
        return DepositCheckConfirmWidget();

      case billPayRoute:
        return BillPayWidget();

      default:
        return const PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404, Page Not Found!')));
  }
}
