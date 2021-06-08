import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:business_banking/features/bills/model/bills_entity.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'bills_service_adapter.dart';

class BillsUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  BillsUseCase(ViewModelCallback<ViewModel> viewModelCallback): _viewModelCallback = viewModelCallback;
  
  Future<void> create() async {
    final scope = ExampleLocator().repository.create<BillsEntity>(BillsEntity(), _notifySubscribers );
    
    return ExampleLocator().repository.runServiceAdapter(scope, BillsServiceAdapter());
  }
  
  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }
  
  BillsViewModel buildViewModel(BillsEntity billsEntityModel) {
    return BillsViewModel(
      paidBillsQty: billsEntityModel.paidBillsQty,
      unpaidBillsQty: billsEntityModel.unpaidBillsQty,
      paidBillsAmount: billsEntityModel.paidBillsAmount,
      unpaidBillsAmount: billsEntityModel.unpaidBillsAmount,
      nextBillPaymentDue: billsEntityModel.nextBillPaymentDue,
      bills: billsEntityModel.bills
    );
  }
}