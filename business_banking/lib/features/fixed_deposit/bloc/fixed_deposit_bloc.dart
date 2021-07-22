import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';

import 'fixed_deposit_request_usecase.dart';

class FixedDepositBloc extends Bloc {
  final fixedDepositRequestViewModelPipe =
      Pipe<FixedDepositRequestViewModel>(canSendDuplicateData: true);
  Pipe<num> onDepositAmountChangePipe = Pipe();
  Pipe<int> onTenureChangePipe = Pipe();
  Pipe<double> onInterestRateChangePipe = Pipe();
  Pipe<String> onEmailAddressChangePipe = Pipe();
  Pipe<String> onNomineeNameChangePipe = Pipe();
  Pipe<String> onRemarksChangePipe = Pipe();
  EventPipe onSubmit = EventPipe();
  late FixedDepositRequestUseCase _fixedDepositRequestUseCase;

  FixedDepositBloc() {
    fixedDepositRequestViewModelPipe.whenListenedDo(() {
      _fixedDepositRequestUseCase.create();
    });
    _fixedDepositRequestUseCase = FixedDepositRequestUseCase(
      (viewmodel) {
        return fixedDepositRequestViewModelPipe.send(viewmodel);
      },
    );
    onDepositAmountChangePipe.receive
        .listen(_onDepositAmountChangePipeListener);
    onTenureChangePipe.receive.listen(_onTenureChangePipeListener);
    onInterestRateChangePipe.receive.listen(_onInterestRateChangePipeListener);
    onEmailAddressChangePipe.receive.listen(_onEmailAddressChangePipeListener);
    onNomineeNameChangePipe.receive.listen(_onNomineeNameChangePipeListener);
    onRemarksChangePipe.receive.listen(_onRemarksChangePipeListener);
    onSubmit.listen(_onSubmitListener);
  }

  @override
  void dispose() {
    fixedDepositRequestViewModelPipe.dispose();
    onDepositAmountChangePipe.dispose();
    onTenureChangePipe.dispose();
    onInterestRateChangePipe.dispose();
    onEmailAddressChangePipe.dispose();
    onNomineeNameChangePipe.dispose();
    onRemarksChangePipe.dispose();
    onSubmit.dispose();
  }

  void _onDepositAmountChangePipeListener(num depositAmount) {
    _fixedDepositRequestUseCase.onDepositAmountUpdate(depositAmount);
  }

  void _onTenureChangePipeListener(int tenure) {
    _fixedDepositRequestUseCase.onTenureUpdate(tenure);
  }

  void _onInterestRateChangePipeListener(double interestRate) {
    _fixedDepositRequestUseCase.onInterestRateUpdate(interestRate);
  }

  void _onEmailAddressChangePipeListener(String emailAddress) {
    _fixedDepositRequestUseCase.onEmailAddressUpdate(emailAddress);
  }

  void _onNomineeNameChangePipeListener(String nomineeName) {
    _fixedDepositRequestUseCase.onNomineeNameUpdate(nomineeName);
  }

  void _onRemarksChangePipeListener(String remarks) {
    _fixedDepositRequestUseCase.onRemarksUpdate(remarks);
  }

  void _onSubmitListener() {
    _fixedDepositRequestUseCase.onSubmit();
  }
}
