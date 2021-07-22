import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/bloc/contact_pay_service_adapter.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_entity.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/material.dart';

class ContactPayFormUseCase extends UseCase {
  late final ViewModelCallback<ContactPayFormViewModel> _viewModelCallBack;

  RepositoryScope? _scope;

  ContactPayFormUseCase(
      ViewModelCallback<ContactPayFormViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
  }

  // Pre-training note (based on observations alone):
  // Repository stores the most up-to-date entity & can be accessed from anywhere via locator
  // (It also runs the service adapter)

  // execute():
  // 1. checks if repository contains a ContactPayEntity scope
  // 2. if not, creates one
  // 3. if it does, sets the scopes' subscription callback to our usecase callback
  // (Dart note: <varName>! exclamation mark is basically an assertion that the
  // object is not null; it should be used once confirmed that the object isn't null)
  // (Same goes for <varName>?, question mark is saying that it could be null and we
  // don't know. Equivalent to Optional[Type] in Python)

  void execute() async {
    _scope = ExampleLocator().repository.containsScope<ContactPayEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<ContactPayEntity>(
          new ContactPayEntity(), _notifyRepositorySubscribers);
    } else {
      _scope!.subscription = _notifyRepositorySubscribers;
    }
    // Had issue for a while where screen would just be black & these last 2 lines were left out;
    // Creating the scope does not actually call the notify callback, you still need to call it yourself
    // to build the viewModel from the entity and send it to the presenter etc.

    final entity = ExampleLocator().repository.get<ContactPayEntity>(_scope!);

    _notifyRepositorySubscribers(entity);
  }

  // Repository subscription must be of base Entity type, not your child entity type
  void _notifyRepositorySubscribers(entity) {
    _viewModelCallBack(_buildViewModel(entity));
  }

  void newPayAmount(double amount) {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<ContactPayEntity>(
          new ContactPayEntity(), _notifyRepositorySubscribers);
    }

    final ContactPayEntity entity =
        ExampleLocator().repository.get<ContactPayEntity>(_scope!);

    ContactPayEntity newEntity = entity.merge(paymentAmount: amount);
    ExampleLocator().repository.update<ContactPayEntity>(_scope!, newEntity);

    _viewModelCallBack(_buildViewModel(newEntity));
  }

  void newContactEmail(String email) {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<ContactPayEntity>(
          new ContactPayEntity(), _notifyRepositorySubscribers);
    }

    // What if scope is null? My answer is to recreate it

    final ContactPayEntity entity =
        ExampleLocator().repository.get<ContactPayEntity>(_scope!);

    ContactPayEntity newEntity = entity.merge(contactEmail: email);
    ExampleLocator().repository.update<ContactPayEntity>(_scope!, newEntity);

    _viewModelCallBack(_buildViewModel(newEntity));
  }

  // When testing, you must mock the service - because of this method
  // Get used to working out what components of classes that need to be mocked
  Future<void> _submitSendMoneyRequest() async {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<ContactPayEntity>(
          new ContactPayEntity(), _notifyRepositorySubscribers);
    }

    final entity = ExampleLocator().repository.get<ContactPayEntity>(_scope!);

    if (_validateUserInput(entity)) {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, ContactPayServiceAdapter());
    } else {
      _viewModelCallBack(_buildViewModel(entity));
    }
  }

  bool _validateUserInput(ContactPayEntity entity) {
    if (entity.paymentAmount > 0 && entity.contactEmail.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void onPressSendMoneyButton(PressSendMoneyButtonEvent event) async {
    await _submitSendMoneyRequest();

    _navigateToConfirmationScreen(event.context);
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.contactPayConfirmationScreenRoute);
  }

  ContactPayFormViewModel _buildViewModel(ContactPayEntity updateEntity) {
    return ContactPayFormViewModel(
        paymentAmount: updateEntity.paymentAmount,
        contactEmail: updateEntity.contactEmail);
  }
}
