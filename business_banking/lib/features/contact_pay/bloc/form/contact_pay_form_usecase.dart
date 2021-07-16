import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_entity.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ContactPayFormUseCase extends UseCase {
  late ContactPayEntity entity;

  late final ViewModelCallback<ContactPayFormViewModel> _viewModelCallBack;

  ContactPayFormUseCase(
      ViewModelCallback<ContactPayFormViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
    entity = ContactPayEntity();
  }

  void getCurrentState() => _viewModelCallBack(_buildViewModel());

  void newPayAmount(double amount) {
    ContactPayEntity newEntity = entity.merge(paymentAmount: amount);
    entity = newEntity;
    _viewModelCallBack(_buildViewModel());
  }

  void newContactEmail(String email) {
    ContactPayEntity newEntity = entity.merge(contactEmail: email);
    entity = newEntity;
    _viewModelCallBack(_buildViewModel());
  }

  void onPressSendMoneyButton(PressSendMoneyButtonEvent event) {
    _navigateToConfirmationScreen(event.context);
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.contactPayConfirmationScreenRoute);
  }

  ContactPayFormViewModel _buildViewModel() {
    return ContactPayFormViewModel(
        paymentAmount: entity.paymentAmount, contactEmail: entity.contactEmail);
  }
}
