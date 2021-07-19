import 'package:business_banking/features/referal/bloc/referal_event.dart';
import 'package:business_banking/features/referal/bloc/referal_usecase.dart';
import 'package:business_banking/features/referal/model/referal_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class referalBloc extends Bloc {
  Pipe<ReferalViewModel> referalViewModelPipe = Pipe();
  Pipe<String> onEmailChangePipe = Pipe(canSendDuplicateData: false);
  Pipe<double> onAmountChangePipe = Pipe();
  Pipe<ReferalEvent> onContactReferalEventPipe =
      Pipe(canSendDuplicateData: true);
  late ReferalUseCase referalUseCase;

  referalBloc() {
    referalViewModelPipe.whenListenedDo(() {
      referalUseCase.getCurrentState();
    });
    onAmountChangePipe.receive.listen(_onAmountValueChangedPipeListener);
    onEmailChangePipe.receive.listen(_onEmailValueChangedPipeListener);
    onContactReferalEventPipe.receive
        .listen(_onContactPayFormEventPipeListener);
    referalUseCase =
        ReferalUseCase((ViewModel) => referalViewModelPipe.send(ViewModel));
    // onEmailChangePipe.receive.listen(_onNameChangePipeListener);
    // onAmountChangePipe.receive.listen();
  }

  @override
  void dispose() {}

  void _onAmountValueChangedPipeListener(double amount) {
    referalUseCase.newAmount(amount);
  }

  void _onEmailValueChangedPipeListener(String email) {
    referalUseCase.newEmail(email);
  }

  void _onContactPayFormEventPipeListener(ReferalEvent event) {
    if (event is ReferalButtonEvent) {
      referalUseCase.addAmount(event);
    }
  }
}
