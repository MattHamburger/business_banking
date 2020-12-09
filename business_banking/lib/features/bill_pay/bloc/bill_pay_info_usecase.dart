import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_service_adapter.dart';
import 'package:business_banking/features/bill_pay/model/entities/bill_pay_info_entity.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayInfoUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  BillPayInfoUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BillPayInfoEntity>();
    if (_scope == null) {
      final newBillPayInfoEntity = BillPayInfoEntity();
      _scope = ExampleLocator()
          .repository
          .create<BillPayInfoEntity>(newBillPayInfoEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, BillPayInfoServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayInfoViewModel buildViewModel(BillPayInfoEntity entity) {
    if(entity.hasErrors()) {
      return BillPayInfoViewModel(
        rules: entity.rules,
        accounts: entity.accounts,
        billers: entity.billers,
        serviceStatus: ServiceStatus.fail
      );
    }
    return BillPayInfoViewModel(
      rules: entity.rules,
      accounts: entity.accounts,
      billers: entity.billers,
      serviceStatus: ServiceStatus.success
    );
  }
}
