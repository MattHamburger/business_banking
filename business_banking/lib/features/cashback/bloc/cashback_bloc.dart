import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackBloc extends Bloc {
  Pipe<CashbackFormViewModel> cashbackFormViewModelPipe = Pipe();

  CashbackFormViewModel staticModel = CashbackFormViewModel('New York');

  CashbackBloc() {
    cashbackFormViewModelPipe.whenListenedDo(() {
      cashbackFormViewModelPipe.send(staticModel);
    });
  }

  @override
  void dispose() {}
}
