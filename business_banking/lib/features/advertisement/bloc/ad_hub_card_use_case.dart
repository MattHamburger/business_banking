import 'package:business_banking/features/advertisement/model/ad_entity.dart';
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'ad_hub_card_service_adapter.dart';

class AdHubCardUseCase extends UseCase {
  ViewModelCallback<AdHubCardViewModel> _viewModelCallback;
  RepositoryScope? _scope;

  AdHubCardUseCase(ViewModelCallback<AdHubCardViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  Future<void> create() async {
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<AdEntity>(AdEntity(), _notifySubscribers);
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, AdHubCardServiceAdapter());
    AdEntity entity = ExampleLocator().repository.get<AdEntity>(_scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  AdHubCardViewModel buildViewModel(AdEntity adEntity) {
    return AdHubCardViewModel(
      adTitle: adEntity.adTitle,
      adIconImage: adEntity.adIconImage,
      id: adEntity.id,
      adDescription: adEntity.adDescription,
      adImage: adEntity.adImage,
    );
  }
}
