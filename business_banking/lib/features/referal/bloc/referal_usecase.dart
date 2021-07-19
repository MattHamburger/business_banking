import 'package:business_banking/features/referal/bloc/referal_event.dart';
import 'package:business_banking/features/referal/model/referal_view_entity.dart';
import 'package:business_banking/features/referal/model/referal_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/cupertino.dart';

class ReferalUseCase extends UseCase {
  late ReferalEntity entity;
  late final ViewModelCallback<ReferalViewModel> _viewModelCallBack;

  ReferalUseCase(ViewModelCallback<ReferalViewModel> viewModelCallBack) {
    _viewModelCallBack = viewModelCallBack;
    entity = ReferalEntity();
  }
  void getCurrentState() => _viewModelCallBack(_buildViewModel());

  ReferalViewModel _buildViewModel() {
    return ReferalViewModel(
        email: entity.referalEmail, amount: entity.amountToBeGained);
  }

  void newAmount(double amount) {
    ReferalEntity newEntity = entity.merge(amountToBeGained: amount);
    entity = newEntity;
    _viewModelCallBack(_buildViewModel());
  }

  void newEmail(String email) {
    ReferalEntity newEntity = entity.merge(referalEmail: email);
    entity = newEntity;
    _viewModelCallBack(_buildViewModel());
  }

  void addAmount(ReferalButtonEvent event) {
    entity.amountToBeGained = entity.amountToBeGained + 15;
    ReferalEntity newEntity =
        entity.merge(amountToBeGained: entity.amountToBeGained);
    entity = newEntity;
    _viewModelCallBack(_buildViewModel());
  }
}
