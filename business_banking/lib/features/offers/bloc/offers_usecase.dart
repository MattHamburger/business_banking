import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

import '../model/offers_entity.dart';
import '../model/offers_view_model.dart';
import 'offers_service_adapter.dart';

class OffersUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallBack;

  @visibleForTesting
  ViewModelCallback<ViewModel> get viewModelCallBack => _viewModelCallBack;

  OffersUseCase(ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  Future<void> execute() async {
    final scope = ExampleLocator()
        .repository
        .create<OffersEntity>(OffersEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, OffersServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(_buildViewModel(entity));
  }

  @visibleForTesting
  OffersViewModel buildViewModel(OffersEntity offersEntity) =>
      _buildViewModel(offersEntity);

  OffersViewModel _buildViewModel(OffersEntity offersEntity) {
    if (offersEntity.hasErrors()) {
      return OffersViewModel(
        offers: offersEntity.offers,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return OffersViewModel(
        offers: offersEntity.offers,
        serviceResponseStatus: ServiceResponseStatus.succeed,
      );
    }
  }
}
