import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackBloc extends Bloc {
  Pipe<CashbackFormViewModel> cashbackFormViewModelPipe = Pipe();
  Pipe<String> onCityChangePipe = Pipe();

  CashbackFormViewModel model = CashbackFormViewModel('New York');

  CashbackBloc() {
    cashbackFormViewModelPipe.whenListenedDo(() {
      cashbackFormViewModelPipe.send(model);
    });

    onCityChangePipe.receive.listen(_onCityChangePipeListener);
  }

  void _onCityChangePipeListener(String city) {
    model = CashbackFormViewModel(city);
    cashbackFormViewModelPipe.send(model);
  }

  @override
  void dispose() {}
}
