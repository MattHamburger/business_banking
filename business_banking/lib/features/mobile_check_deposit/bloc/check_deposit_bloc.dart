import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_confirmation_usecase.dart';
import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_usecase.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_confirmation_view_model.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CheckDepositBloc extends Bloc {
  CheckDepositUseCase _fundsUseCase;
  CheckDepositConfirmationUseCase _confirmationUseCase;

  final checkDepositViewModelPipe = Pipe<CheckDepositViewModel>();
  final toAccountPipe = Pipe<String>();
  final amountPipe = Pipe<String>();
  final datePipe = Pipe<DateTime>();
  final checkFrontImage = Pipe<String>();
  final checkBackImage = Pipe<String>();
  final submitPipe = EventPipe();
  final resetServiceStatusPipe = EventPipe();
  final confirmationViewModelPipe = Pipe<CheckDepositConfirmationViewModel>();
  final resetViewModelPipe = EventPipe();

  CheckDepositBloc() {
    _fundsUseCase = CheckDepositUseCase(
            (viewModel) => checkDepositViewModelPipe.send(viewModel));
    checkDepositViewModelPipe.whenListenedDo(() {
      _fundsUseCase.create();
    });

    _confirmationUseCase = CheckDepositConfirmationUseCase((viewModel) => confirmationViewModelPipe.send(viewModel));
    confirmationViewModelPipe.whenListenedDo(() {
      _confirmationUseCase.create();
    });

    toAccountPipe.receive.listen(toAccountInputHandler);
    amountPipe.receive.listen(amountPipeHandler);
    checkFrontImage.receive.listen(checkFrontImageHandler);
    checkBackImage.receive.listen(checkBackImageHandler);
    datePipe.receive.listen(dateHandler);
    resetServiceStatusPipe.listen(() => _fundsUseCase.resetServiceStatus());
    submitPipe.listen(() => _fundsUseCase.submitDeposit());
    resetViewModelPipe.listen(() => _confirmationUseCase.clearTransferData());
  }



  void toAccountInputHandler(String toAccount) {
    _fundsUseCase.updateToAccount(toAccount);
  }

  void amountPipeHandler(String amount) {
    _fundsUseCase.updateAmount(amount);
  }

  void checkFrontImageHandler(String checkFrontBase64){
    _fundsUseCase.updateFrontCheckImage(checkFrontBase64);
  }

  void checkBackImageHandler(String checkBackBase64){
    _fundsUseCase.updateBackCheckImage(checkBackBase64);
  }

  void dateHandler(DateTime date) {
    _fundsUseCase.updateDate(date);
  }

  @override
  void dispose() {
    checkDepositViewModelPipe.dispose();
    toAccountPipe.dispose();
    amountPipe.dispose();
    datePipe.dispose();
    submitPipe.dispose();
    resetServiceStatusPipe.dispose();
    confirmationViewModelPipe.dispose();
    resetViewModelPipe.dispose();
    checkFrontImage.dispose();
    checkBackImage.dispose();
  }
}