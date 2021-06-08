import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'bills_usecase.dart';

class BillsBloc extends Bloc {
  final billsViewEventsPipe = Pipe<BillsViewEvents>(canSendDuplicateData: true);
  BillsUseCase? _billsUseCase;
  final billsViewModelPipe = Pipe<BillsViewModel>();
  
  BillsBloc({BillsUseCase? billsUseCase}) {
    billsViewEventsPipe.receive.listen((event) {
      billsVewEventsPipeHandler(event);
    });
    
    _billsUseCase = billsUseCase ?? BillsUseCase((viewModel) => billsViewModelPipe.send(viewModel as BillsViewModel));
    
    billsViewModelPipe.whenListenedDo(() {
      _billsUseCase!.create();
    });
  }
  
  @override
  void dispose() {
    billsViewEventsPipe.dispose();
    billsViewModelPipe.dispose();
  }
  
  

  billsVewEventsPipeHandler(BillsViewEvents event) {
    print('got an event ${event.stringify}');
  }
}

abstract class BillsViewEvents extends Equatable {}