import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_entity.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';
import 'bill_pay_card_service_adapter.dart';

class BillPayCardUseCase extends UseCase {
  late final ViewModelCallback<BillPayCardViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  BillPayCardUseCase(
      ViewModelCallback<BillPayCardViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    _scope =
        ExampleLocator().repository.containsScope<BillPayCardEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayCardEntity>(
          new BillPayCardEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, BillPayCardServiceAdapter());
    } else {
      _scope!.subscription = _notifySubscribers;
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayCardViewModel buildViewModel(BillPayCardEntity entity) {
    if (entity.hasErrors()) {
      return BillPayCardViewModel(
        billsDue: entity.billsDue,
        serviceRequestStatus: ServiceRequestStatus.failed,
      );
    } else {
      return BillPayCardViewModel(
        billsDue: entity.billsDue,
        serviceRequestStatus: ServiceRequestStatus.success,
      );
    }
  }
}
