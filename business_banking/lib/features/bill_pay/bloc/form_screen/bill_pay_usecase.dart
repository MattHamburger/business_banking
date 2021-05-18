import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';
import 'bill_pay_post_service_adapter.dart';
import 'bill_pay_retrieval_service_adapter.dart';

class BillPayUseCase extends UseCase {
  late final ViewModelCallback<BillPayViewModel> _viewModelCallBack;
  RepositoryScope? _scope;

  BillPayUseCase(
      ViewModelCallback<BillPayViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    _scope =
        ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);

      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, BillPayRetrievalServiceAdapter());
    } else {
      _scope!.subscription = _notifySubscribers;
      final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);
      _notifySubscribers(entity);
    }
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayViewModel buildViewModel(BillPayEntity entity) {
    if (entity.hasErrors()) {
      return BillPayViewModel(
        allBills: entity.allBills,
        selectedBillIndex: entity.selectedBillIndex,
        serviceRequestStatus: ServiceRequestStatus.failed,
        payStatus: entity.payStatus,
        referenceNumber: entity.referenceNumber
      );
    } else {
      return BillPayViewModel(
        allBills: entity.allBills,
        selectedBillIndex: entity.selectedBillIndex,
        serviceRequestStatus: ServiceRequestStatus.success,
        payStatus: entity.payStatus,
        referenceNumber: entity.referenceNumber
      );
    }
  }

  void updateSelectedBillIndex(int selectedBillIndex) {
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<BillPayEntity>(
          new BillPayEntity(), _notifySubscribers);
    }

    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);

    final updatedEntity = entity.merge(selectedBillIndex: selectedBillIndex);
    ExampleLocator()
        .repository
        .update<BillPayEntity>(_scope!, updatedEntity);
    _viewModelCallBack(buildViewModel(updatedEntity));
  }

  Future<void> confirmBillPayed() async {
    //User can't get this far if scope is null
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);

    //update pay status so there aren't any more pop ups
    final updatedEntity = entity.merge(payStatus: PayBillStatus.none);
    ExampleLocator()
        .repository
        .update<BillPayEntity>(_scope!, updatedEntity);
    _viewModelCallBack(buildViewModel(updatedEntity));

    //re-retrieve bills since there should be one less
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, BillPayRetrievalServiceAdapter());
  }

  Future<void> payBill() async {
    //We shouldn't check if scope is null since the user can't pay a bill
    //without having selected a bill, which guarantees there's a scope
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope!);
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, BillPayPostServiceAdapter());
    //_viewModelCallBack(buildViewModel(entity));
  }
}
