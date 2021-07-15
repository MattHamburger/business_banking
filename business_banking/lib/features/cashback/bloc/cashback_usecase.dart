import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackUsecase extends UseCase {
  late CashbackEntity entity;

  late final ViewModelCallback<CashbackFormViewModel> _viewModelCallBack;

  CashbackUsecase(ViewModelCallback<CashbackFormViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
    entity = CashbackEntity();
  }

  void getCurrentState() => _viewModelCallBack(_buildViewModel());

  void onCityUpdate(String newCityValue) {
    entity = CashbackEntity(city: newCityValue);
    _viewModelCallBack(_buildViewModel());
  }

  CashbackFormViewModel _buildViewModel() {
    return CashbackFormViewModel(
      entity.city,
      entity.address,
      entity.cashbackOption,
    );
  }
}
