import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/confirmation/contact_pay_confirmation_view_model.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_entity.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/locator.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class ContactPayConfirmationUseCase extends UseCase {
  late final ViewModelCallback<ContactPayConfirmationViewModel>
      _viewModelCallBack;

  RepositoryScope? _scope;

  ContactPayConfirmationUseCase(
      ViewModelCallback<ContactPayConfirmationViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
  }

  void execute() async {
    _scope = ExampleLocator().repository.containsScope<ContactPayEntity>();
    if (_scope == null) {
      throw StateError(
          'ContactPayEntity does not exist'); // The scope should exist by this point if everything is working correctly; we just created it in the previous screen (ContactPayFormUseCase)
    }

    _scope!.subscription = _notifyRepositorySubscribers;

    final ContactPayEntity entity =
        ExampleLocator().repository.get<ContactPayEntity>(_scope!);

    _notifyRepositorySubscribers(entity);
  }

  void _notifyRepositorySubscribers(entity) {
    _viewModelCallBack(_buildViewModel(entity));
  }

  void onPressOKButton(PressOKButtonEvent event) {
    CFRouterScope.of(event.context).popUntil(BusinessBankingRouter.hubRoute);
  }

  ContactPayConfirmationViewModel _buildViewModel(
      ContactPayEntity updateEntity) {
    if (updateEntity.errorCode == 0) {
      return ContactPayConfirmationViewModel(
          confirmationId: updateEntity.confirmationId,
          errorCode: updateEntity.errorCode,
          serviceResponseStatus: ServiceResponseStatus.succeed);
    } else {
      return ContactPayConfirmationViewModel(
          confirmationId: updateEntity.confirmationId,
          errorCode: updateEntity.errorCode,
          serviceResponseStatus: ServiceResponseStatus.failed);
    }
  }
}
