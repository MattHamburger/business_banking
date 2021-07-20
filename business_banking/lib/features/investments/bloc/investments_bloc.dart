import 'package:business_banking/features/investments/bloc/investments_card/investments_usecase.dart';
import 'package:business_banking/features/investments/bloc/investments_details/investments_details_event.dart';
import 'package:business_banking/features/investments/bloc/investments_details/investments_details_use_case.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_view_model.dart';
import 'package:business_banking/features/investments/model/investments_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class InvestmentsBloc extends Bloc {
  final investmentsViewModelPipe = Pipe<InvestmentsViewModel>();
  final investmentsDetailsViewModelPipe = Pipe<InvestmentsDetailsViewModel>();

  final investmentDetailsEventPipe =
      Pipe<InvestmentsDetailsEvent>(canSendDuplicateData: true);
  final submitPipe = EventPipe();
  final symbolPipe = Pipe();

  late InvestmentsDetailsUseCase _investmentsDetailsUseCase;

  @override
  void dispose() {}

  InvestmentsBloc({
    InvestmentsUseCase? investmentsUseCase,
    InvestmentsDetailsUseCase? investmentsDetailsUseCase,
  }) {
    _investmentsDetailsUseCase = InvestmentsDetailsUseCase((viewModel) =>
        investmentsDetailsViewModelPipe
            .send(viewModel as InvestmentsDetailsViewModel));

    investmentsUseCase = investmentsUseCase ??
        InvestmentsUseCase((viewModel) =>
            investmentsViewModelPipe.send(viewModel as InvestmentsViewModel));
    investmentsViewModelPipe.whenListenedDo(() => investmentsUseCase!.create());

    investmentsDetailsUseCase = investmentsDetailsUseCase ??
        InvestmentsDetailsUseCase((viewModel) => investmentsDetailsViewModelPipe
            .send(viewModel as InvestmentsDetailsViewModel));
    investmentsDetailsViewModelPipe
        .whenListenedDo(() => investmentsDetailsUseCase!.create());

    submitPipe.listen(submitHandler);
    symbolPipe.receive.listen(userSymbol);
  }

  void userSymbol(symbol) {
    _investmentsDetailsUseCase.updateStockSymbol(symbol);
  }

  void submitHandler() {
    _investmentsDetailsUseCase.searchStockSymbol();
  }
}
