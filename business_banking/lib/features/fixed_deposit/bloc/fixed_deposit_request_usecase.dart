import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_entity.dart';
import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class FixedDepositRequestUseCase extends UseCase {
  late final ViewModelCallback<FixedDepositRequestViewModel> _viewModelCallback;

  FixedDepositRequestUseCase(
      ViewModelCallback<FixedDepositRequestViewModel> viewModelCallback) {
    _viewModelCallback = viewModelCallback;
  }

  Future<void> create() async {
    var _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    if (_scope == null) {
      final entity = FixedDepositRequestEntity();
      _scope = ExampleLocator().repository.create<FixedDepositRequestEntity>(
          entity, _notifySubscribers,
          deleteIfExists: true);
      _notifySubscribers(entity);
    } else {
      _scope.subscription = _notifySubscribers;
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(_buildViewModel(entity));
  }

  void getCurrentState() {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(scope!);
    _notifySubscribers(entity);
  }

  FixedDepositRequestViewModel _buildViewModel(
      FixedDepositRequestEntity entity) {
    return FixedDepositRequestViewModel(isBusy: false);
  }

  void onDepositAmountUpdate(num depositAmount) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(depositAmount: depositAmount);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope, updatedEntity);
  }

  void onTenureUpdate(int tenure) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(tenure: tenure);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope!, updatedEntity);
  }

  void onInterestRateUpdate(double interestRate) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(interestRate: interestRate);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope!, updatedEntity);
  }

  void onEmailAddressUpdate(String emailAddress) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(emailAddress: emailAddress);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope!, updatedEntity);
  }

  void onNomineeNameUpdate(String nomineeName) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(nomineeName: nomineeName);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope!, updatedEntity);
  }

  void onRemarksUpdate(String remarks) {
    final RepositoryScope<Entity>? _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    final entity =
        ExampleLocator().repository.get<FixedDepositRequestEntity>(_scope!);
    final updatedEntity = entity.merge(remarks: remarks);
    ExampleLocator()
        .repository
        .update<FixedDepositRequestEntity>(_scope!, updatedEntity);
  }
}
