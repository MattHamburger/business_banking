import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/customer/ui/customer_detail_widget.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:business_banking/features/stocks_detail/ui/stocks_list_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_widget.dart';
import 'package:flutter/material.dart';

import 'features/investment_detail/ui/investment_detail_feature_widget.dart';

abstract class BusinessBankingRouter {
  static const String initialRoute = '/';
  static const String hubRoute = '/hub';
  static const String transferFundsRoute = '/transferFunds';
  static const String transferFundsConfirmRoute = '/transferFundsConfirm';
  static const String accountDetailRoute = '/accountDetail';
  static const String customerDetailRoute = '/customerDetail';
  static const String viewBudgetChartRoute = '/viewBudgetChartRoute';
  static const String investmentDetailRoute = '/investmentDetail';
  static const String stocksListScreenRoute = '/stocksDetail';

  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LoginFeatureWidget();

      case hubRoute:
        return HubScreen();

      case transferFundsRoute:
        return TransferFundsWidget();

      case transferFundsConfirmRoute:
        return TransferFundsConfirmationWidget();

      case accountDetailRoute:
        return AccountDetailWidget();

      case customerDetailRoute:
        return CustomerDetailWidget();

      case viewBudgetChartRoute:
        return ViewChartWidget();

      case investmentDetailRoute:
        return InvestmentDetailWidget();

      case stocksListScreenRoute:
        return StocksListWidget();

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
