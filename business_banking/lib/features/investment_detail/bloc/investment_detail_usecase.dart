// package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import 'investment_detail_service_adapter.dart';
import '../model/investment_detail_entity.dart';
import '../model/investment_detail_view_model.dart';
import '../../../locator.dart';

class InvestmentDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  InvestmentDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope =
        ExampleLocator().repository.containsScope<InvestmentDetailEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<InvestmentDetailEntity>(
          InvestmentDetailEntity(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, InvestmentDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  InvestmentDetailViewModel buildViewModel(InvestmentDetailEntity entity) {
    return InvestmentDetailViewModel(
        accountBalance: entity.accountBalance,
        totalGainPercent: entity.totalGainPercent,
        totalGainValue: entity.totalGainValue,
        investments: entity.investments);
  }
}
