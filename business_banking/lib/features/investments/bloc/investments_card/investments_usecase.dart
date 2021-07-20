import 'package:business_banking/features/investments/bloc/investments_card/investments_service_adapter.dart';
import 'package:business_banking/features/investments/model/investments_entity.dart';
import 'package:business_banking/features/investments/model/investments_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  InvestmentsUseCase(Function(ViewModel) viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<InvestmentsEntity>();
    if (_scope == null) {
      final newEntity = InvestmentsEntity();
      _scope = ExampleLocator()
          .repository
          .create<InvestmentsEntity>(newEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, InvestmentsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _buildViewModelForServiceUpdate(entity);
  }

  _buildViewModelForServiceUpdate(InvestmentsEntity entity) async {
    if (entity.hasErrors()) {
      _viewModelCallBack(InvestmentsViewModel(
          askPrice: entity.askPrice,
          askSize: entity.askSize,
          bidPrice: entity.bidPrice,
          bidSize: entity.bidSize,
          lastTradePrice: entity.lastTradePrice,
          lastExtendedHoursTradePrice: entity.lastExtendedHoursTradePrice,
          previousClose: entity.previousClose,
          adjustedPreviousClose: entity.adjustedPreviousClose,
          previousCloseDate: entity.previousCloseDate,
          symbol: entity.symbol,
          tradingHalted: entity.tradingHalted,
          hasTraded: entity.hasTraded,
          lastTradePriceSource: entity.lastTradePriceSource,
          updatedAt: entity.updatedAt,
          instrument: entity.instrument,
          instrumentId: entity.instrumentId));
    } else {
      _viewModelCallBack(InvestmentsViewModel(
          askPrice: entity.askPrice,
          askSize: entity.askSize,
          bidPrice: entity.bidPrice,
          bidSize: entity.bidSize,
          lastTradePrice: entity.lastTradePrice,
          lastExtendedHoursTradePrice: entity.lastExtendedHoursTradePrice,
          previousClose: entity.previousClose,
          adjustedPreviousClose: entity.adjustedPreviousClose,
          previousCloseDate: entity.previousCloseDate,
          symbol: entity.symbol,
          tradingHalted: entity.tradingHalted,
          hasTraded: entity.hasTraded,
          lastTradePriceSource: entity.lastTradePriceSource,
          updatedAt: entity.updatedAt,
          instrument: entity.instrument,
          instrumentId: entity.instrumentId));
    }
  }
}
