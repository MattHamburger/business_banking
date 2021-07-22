import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackBloc extends Bloc {
  Pipe<CashbackFormViewModel> cashbackFormViewModelPipe = Pipe();
  Pipe<String> onCityChangePipe = Pipe();
  EventPipe onFormSubmitEvent = EventPipe();

  late CashbackUsecase _cashbackUsecase;

  CashbackBloc({CashbackUsecase? cashbackUsecase}) {
    _cashbackUsecase = cashbackUsecase ??
        CashbackUsecase((viewModel) {
          print(viewModel);
          cashbackFormViewModelPipe.send(viewModel);
          return true;
        });

    cashbackFormViewModelPipe.whenListenedDo(() {
      _cashbackUsecase.getCurrentState();
    });

    onCityChangePipe.receive.listen(_onCityChangePipeListener);
    onFormSubmitEvent.listen(_onFormSubmitEventListener);
  }

  @override
  void dispose() {
    cashbackFormViewModelPipe.dispose();
    onCityChangePipe.dispose();
    onFormSubmitEvent.dispose();
  }

  void _onCityChangePipeListener(String city) {
    _cashbackUsecase.onCityUpdate(city);
  }

  void _onFormSubmitEventListener() {
    _cashbackUsecase.submitCashbackForm();
  }
}
