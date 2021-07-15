import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackBloc extends Bloc {
  Pipe<CashbackFormViewModel> cashbackFormViewModelPipe = Pipe();
  Pipe<String> onCityChangePipe = Pipe();

  late CashbackUsecase cashbackUsecase;

  CashbackBloc() {
    cashbackFormViewModelPipe.whenListenedDo(() {
      cashbackUsecase.getCurrentState();
    });

    onCityChangePipe.receive.listen(_onCityChangePipeListener);

    cashbackUsecase = CashbackUsecase(
        (viewModel) => cashbackFormViewModelPipe.send(viewModel));
  }

  void _onCityChangePipeListener(String city) {
    cashbackUsecase.onCityUpdate(city);
  }

  @override
  void dispose() {}
}
