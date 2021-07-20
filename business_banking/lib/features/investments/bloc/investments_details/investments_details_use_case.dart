import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/investments/bloc/investments_details/investments_details_service_adapter.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_entity.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsDetailsUseCase extends UseCase {
  late final ViewModelCallback<InvestmentsDetailsViewModel> _viewModelCallBack;

  ///Utilized a Repository Scope
  RepositoryScope? _scope;

  InvestmentsDetailsUseCase(
    ViewModelCallback<InvestmentsDetailsViewModel> viewModelCallBack,
  ) : _viewModelCallBack = viewModelCallBack;

  ///Provide Constructor for specific use case type
  void execute() async {
    _scope =
        ExampleLocator().repository.containsScope<InvestmentsDetailsEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<InvestmentsDetailsEntity>(
          new InvestmentsDetailsEntity(), _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    final entity =
        ExampleLocator().repository.get<InvestmentsDetailsEntity>(_scope!);

    _notifySubscribers(entity);
  }

  void create() async {
    _scope =
        ExampleLocator().repository.containsScope<InvestmentsDetailsEntity>();
    if (_scope == null) {
      final newEntity = InvestmentsDetailsEntity(symbol: '');
      _scope = ExampleLocator()
          .repository
          .create<InvestmentsDetailsEntity>(newEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    final entity =
        ExampleLocator().repository.get<InvestmentsDetailsEntity>(_scope!);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  // late DepositCheckViewModel _currentCheckViewModel;
  InvestmentsDetailsViewModel buildViewModel(
    InvestmentsDetailsEntity entity, {
    String status = '',
    isUserInputValid = true,
    inputStatusType = InputStatusType.unknown,
    isResetAction = false,
  }) {
    if (entity.hasErrors()) {
      return InvestmentsDetailsViewModel(
          symbol: entity.symbol, quote: entity.quote);
    } else {
      return InvestmentsDetailsViewModel(
          symbol: entity.symbol, quote: entity.quote);
    }
  }

  void updateStockSymbol(String symbol) async {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<InvestmentsDetailsEntity>(
          InvestmentsDetailsEntity(), _notifySubscribers);
    }
    final entity =
        ExampleLocator().repository.get<InvestmentsDetailsEntity>(_scope!);
    final updatedEntity = entity.merge(symbol: symbol);
    ExampleLocator()
        .repository
        .update<InvestmentsDetailsEntity>(_scope!, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  InvestmentsDetailsViewModel buildViewModelForLocalUpdate(
      InvestmentsDetailsEntity entity) {
    return InvestmentsDetailsViewModel(symbol: entity.symbol!);
  }

  InvestmentsDetailsViewModel buildViewModelForServiceUpdate(
      InvestmentsDetailsEntity entity) {
    if (entity.hasErrors()) {
      return InvestmentsDetailsViewModel(symbol: entity.symbol);
    } else {
      return InvestmentsDetailsViewModel(
          symbol: entity.symbol, quote: entity.quote);
    }
  }

  Future<void> searchStockSymbol() async {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<InvestmentsDetailsEntity>(
          new InvestmentsDetailsEntity(), _notifySubscribers);
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, InvestmentsDetailsServiceAdapter());
  }
}
