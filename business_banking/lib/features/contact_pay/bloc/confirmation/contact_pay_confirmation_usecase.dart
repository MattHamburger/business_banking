import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/confirmation/contact_pay_confirmation_view_model.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_entity.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';

class ContactPayConfirmationUseCase extends UseCase {
  late ContactPayEntity entity;

  late final ViewModelCallback<ContactPayConfirmationViewModel>
      _viewModelCallBack;

  ContactPayConfirmationUseCase(
      ViewModelCallback<ContactPayConfirmationViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
    entity = ContactPayEntity(confirmationId: '328573');
  }

  void getCurrentState() => _viewModelCallBack(_buildViewModel());

  void onPressOKButton(PressOKButtonEvent event) {
    CFRouterScope.of(event.context).popUntil(BusinessBankingRouter.hubRoute);
  }

  ContactPayConfirmationViewModel _buildViewModel() {
    return ContactPayConfirmationViewModel(
        confirmationId: entity.confirmationId);
  }
}
