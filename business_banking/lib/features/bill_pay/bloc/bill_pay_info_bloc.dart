import 'package:business_banking/features/bill_pay/api/services/bill_pay_info_service.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_service_adapter.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_usecase.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BillPayInfoBloc extends Bloc {

  BillPayInfoUseCase _billPayInfoUseCase;

  final billPayInfoViewModelPipe = Pipe<BillPayInfoViewModel>();

  @override
  void dispose() {
    billPayInfoViewModelPipe.dispose();
  }

  BillPayInfoBloc({BillPayInfoService billPayInfoService}) {
    _billPayInfoUseCase = BillPayInfoUseCase((viewModel) {
      return billPayInfoViewModelPipe.send(viewModel);
    });

    billPayInfoViewModelPipe.whenListenedDo(() {
      _billPayInfoUseCase.create();
    });
  }
}