import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/new_cards/bloc/new_cards_service_adapter.dart';
import 'package:business_banking/features/new_cards/models/new_cards_entity.dart';
import 'package:business_banking/features/new_cards/models/new_cards_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewCardsUseCase extends UseCase {
  late final ViewModelCallback<NewCardsViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  NewCardsUseCase(ViewModelCallback<NewCardsViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
     _scope = ExampleLocator().repository.create<NewCardsEntity>(NewCardsEntity(), _notifySubscribers);
    ExampleLocator().repository.runServiceAdapter(_scope!, NewCardsServiceAdapter());
    
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }


  NewCardsViewModel buildViewModel(NewCardsEntity entity) {
    if (entity.hasErrors()) {
      return NewCardsViewModel(
        allCards: [],
        serviceStatus: ServiceResponseStatus.failed,
      );
    } else {
      return NewCardsViewModel(
        allCards: entity.allCards ?? [],
        serviceStatus: ServiceResponseStatus.succeed,
      );
    }
  }
}
