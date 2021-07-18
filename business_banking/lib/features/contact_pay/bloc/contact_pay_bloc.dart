// Main job of bloc - add the channel of communication to the presenter
import 'package:business_banking/features/contact_pay/bloc/form/contact_pay_form_usecase.dart';
import 'package:business_banking/features/contact_pay/bloc/confirmation/contact_pay_confirmation_usecase.dart';
import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/confirmation/contact_pay_confirmation_view_model.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class ContactPayBloc extends Bloc {
  Pipe<ContactPayFormViewModel> contactPayFormViewModelPipe = Pipe();
  Pipe<ContactPayConfirmationViewModel> contactPayConfirmationViewModelPipe =
      Pipe();

  Pipe<double> onPayAmountChangedPipe = Pipe(canSendDuplicateData: true);
  Pipe<String> onContactEmailChangedPipe = Pipe(canSendDuplicateData: true);

  Pipe<ContactPayFormEvent> onContactPayFormEventPipe =
      Pipe(canSendDuplicateData: true);
  Pipe<ContactPayConfirmationEvent> onContactPayConfirmationEventPipe =
      Pipe(canSendDuplicateData: true);

  late ContactPayFormUseCase contactPayFormUseCase;
  late ContactPayConfirmationUseCase contactPayConfirmationUseCase;

  ContactPayBloc() {
    contactPayFormViewModelPipe.whenListenedDo(() {
      contactPayFormUseCase.execute();
    });
    contactPayConfirmationViewModelPipe.whenListenedDo(() {
      contactPayConfirmationUseCase.execute();
    });

    onPayAmountChangedPipe.receive.listen(_onPayAmountValueChangedPipeListener);
    onContactEmailChangedPipe.receive
        .listen(_onContactEmailValueChangedPipeListener);

    onContactPayFormEventPipe.receive
        .listen(_onContactPayFormEventPipeListener);
    onContactPayConfirmationEventPipe.receive
        .listen(_onContactPayConfirmationEventPipeListener);

    contactPayFormUseCase = ContactPayFormUseCase(
        (viewModel) => contactPayFormViewModelPipe.send(viewModel));
    contactPayConfirmationUseCase = ContactPayConfirmationUseCase(
        (viewModel) => contactPayConfirmationViewModelPipe.send(viewModel));
  }

  void _onPayAmountValueChangedPipeListener(double newPayValue) {
    contactPayFormUseCase.newPayAmount(newPayValue);
  }

  void _onContactEmailValueChangedPipeListener(String newContactEmail) {
    contactPayFormUseCase.newContactEmail(newContactEmail);
  }

  void _onContactPayFormEventPipeListener(ContactPayFormEvent event) {
    if (event is PressSendMoneyButtonEvent) {
      contactPayFormUseCase.onPressSendMoneyButton(event);
    }
  }

  void _onContactPayConfirmationEventPipeListener(
      ContactPayConfirmationEvent event) {
    if (event is PressOKButtonEvent) {
      contactPayConfirmationUseCase.onPressOKButton(event);
    }
  }

  @override
  void dispose() {
    contactPayFormViewModelPipe.dispose();
    contactPayConfirmationViewModelPipe.dispose();
    onPayAmountChangedPipe.dispose();
    onContactEmailChangedPipe.dispose();
    onContactPayFormEventPipe.dispose();
    onContactPayConfirmationEventPipe.dispose();
  }
}
