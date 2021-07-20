import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_widget.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/investments/ui/investments_details/investments_details_widget.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_widget.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_success_screen/new_online_registration_success_widget.dart';
import 'package:flutter/material.dart';

import 'features/credit_card/ui/payment_request/credit_card_payment_request_widget.dart';
import 'features/credit_card/ui/payment_response/credit_card_payment_response_widget.dart';
import 'features/deposit_check/ui/2nd_data_entry/deposit_check_widget.dart';
import 'features/deposit_check/ui/3rd_request_confirmation/deposit_check_confirm_widget.dart';

abstract class BusinessBankingRouter {
  static const String initialRoute = '/';
  static const String hubRoute = '/hub';
  static const String newOnlineRegistrationScreen =
      '/newOnlineRegistrationScreen';
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
  static const String investmentBankingRoute = '/investments';
  static const String depositCheckConfirmRoute = '/depositCheckConfirm';
  static const String NewSuccessScreen = '/NewSuccessScreen';

  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LoginFeatureWidget();

      case hubRoute:
        return HubScreen();

      case newOnlineRegistrationScreen:
        return NewOnlineRegistrationRequestWidget();

      case viewBudgetChartRoute:
        return ViewChartWidget();

      case creditCardDetailsRoute:
        return CreditCardDetailsWidget();

      case creditCardPaymentRequestRoute:
        return CreditCardPaymentRequestWidget();

      case creditCardPaymentResponseRoute:
        return CreditCardPaymentResponseWidget();

      case depositCheckRoute:
        return DepositCheckWidget();

      case depositCheckConfirmRoute:
        return DepositCheckConfirmWidget();

      case investmentBankingRoute:
        return InvestmentsDetailsWidget();

      case NewSuccessScreen:
        return NewOnlineRegistrationRequestSuccessWidget();
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
