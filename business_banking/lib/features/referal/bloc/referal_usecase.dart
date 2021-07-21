import 'package:business_banking/features/referal/bloc/referal_event.dart';
import 'package:business_banking/features/referal/model/referal_view_entity.dart';
import 'package:business_banking/features/referal/model/referal_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter/cupertino.dart';

class ReferalUseCase extends UseCase {
  // late ReferalEntity entity;
  late final ViewModelCallback<ReferalViewModel> _viewModelCallBack;

  ReferalUseCase(ViewModelCallback<ReferalViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
    ExampleLocator().repository.create<ReferalEntity>(
        ReferalEntity(), _notifySubscribers,
        deleteIfExists: true);
  }

  void getCurrentState() {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<ReferalEntity>();
    // TODO What if the scope is null?

    final entity = ExampleLocator().repository.get<ReferalEntity>(scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(_buildViewModel(entity));
  }

  void newAmount(double amount) {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<ReferalEntity>();
    final entity = ExampleLocator().repository.get<ReferalEntity>(scope!);
    final newEntity = entity.merge(amountToBeGained: amount);
    ExampleLocator().repository.update(scope, newEntity);
    _notifySubscribers(newEntity);
  }

  void newEmail(String email) {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<ReferalEntity>();
    final entity = ExampleLocator().repository.get<ReferalEntity>(scope!);
    final newEntity = entity.merge(referalEmail: email);
    ExampleLocator().repository.update(scope, newEntity);
    _notifySubscribers(newEntity);
  }

  void addAmount() {
    print("Migo");
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<ReferalEntity>();
    final entity = ExampleLocator().repository.get<ReferalEntity>(scope!);
    entity.amountToBeGained += 15;
    final newEntity = entity.merge(amountToBeGained: entity.amountToBeGained);
    ExampleLocator().repository.update(scope, newEntity);
    _notifySubscribers(newEntity);
  }

  ReferalViewModel _buildViewModel(ReferalEntity entity) {
    return ReferalViewModel(
        email: entity.referalEmail, amount: entity.amountToBeGained);
  }
}
