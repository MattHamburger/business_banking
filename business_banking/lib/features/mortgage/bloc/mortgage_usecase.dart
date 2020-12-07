import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';
import '../model/mortgage_entity.dart';
import '../model/mortgage_view_model.dart';
import 'mortgage_service_adaptor.dart';

class MortgageUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  MortgageUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<MortgageEntity>();
    if (_scope == null) {
      final newMortgageEntity = MortgageEntity();
      _scope = ExampleLocator()
          .repository
          .create<MortgageEntity>(newMortgageEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, MortgageServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  MortgageViewModel buildViewModel(MortgageEntity entity) {
    return MortgageViewModel(mortgageEntity: entity);
  }
}
