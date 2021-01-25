import 'package:business_banking/features/bank_locator/api/bank_locator_service.dart';
import 'package:business_banking/features/bank_locator/bloc/bank_locator_usecase.dart';
import 'package:business_banking/features/bank_locator/model/bank_locator_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BankLocatorBloc extends Bloc {
  // Bank Locator Use Case
  BankLocatorUseCase _bankLocatorUseCase;

  // Pipes
  final bankLocatorViewModelPipe = Pipe<BankLocatorViewModel>();
  final latitudePipe = Pipe<double>();
  final longitudePipe = Pipe<double>();

  BankLocatorBloc({BankLocatorService service}) {
    _bankLocatorUseCase = BankLocatorUseCase(
        (viewModel) => bankLocatorViewModelPipe.send(viewModel));
    bankLocatorViewModelPipe.whenListenedDo(() => _bankLocatorUseCase.create());
  }

  @override
  void dispose() {
    bankLocatorViewModelPipe.dispose();
    latitudePipe.dispose();
    longitudePipe.dispose();
  }
}
