import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_entity.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';
import 'account_info_struct_list_service_adapter.dart';

class StatementCardUseCase extends UseCase {
  late final ViewModelCallback<StatementCardViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  StatementCardUseCase(
      ViewModelCallback<StatementCardViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    _scope = ExampleLocator().repository.containsScope<StatementCardEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<StatementCardEntity>(
          new StatementCardEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, AccountInfoListServiceAdapter());
    } else {
      _scope!.subscription = _notifySubscribers;
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  StatementCardViewModel buildViewModel(StatementCardEntity entity) {
    if (entity.hasErrors()) {
      return StatementCardViewModel(
        accounts: entity.accounts,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return StatementCardViewModel(
        accounts: entity.accounts,
        serviceResponseStatus: ServiceResponseStatus.succeed,
      );
    }
  }
}
