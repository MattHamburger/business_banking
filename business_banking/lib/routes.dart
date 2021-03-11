import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:business_banking/features/customer/ui/customer_detail_widget.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_feature_widget.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_widget.dart';
import 'package:flutter/material.dart';

abstract class BusinessBankingRouter {
  static const String initialRoute = '/';
  static const String hubRoute = '/hub';
  static const String transferFundsRoute = '/transferFunds';
  static const String transferFundsConfirmRoute = '/transferFundsConfirm';
  static const String accountDetailRoute = '/accountDetail';
  static const String customerDetailRoute = '/customerDetail';
  static const String investmentDetailRoute = '/investmentDetail';

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

      case investmentDetailRoute:
        return InvestmentDetailWidget();

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
