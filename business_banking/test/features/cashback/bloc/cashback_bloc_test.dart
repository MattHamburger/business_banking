import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('CashbackBloc initial model', () async {
    final useCase = CashbackUsecaseMock();
    final bloc = CashbackBloc(cashbackUsecase: useCase);
    useCase.viewModelPipe = bloc.cashbackFormViewModelPipe;

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenBeingListenedTo().thenExpectA(
        CashbackFormViewModel('test', 'test', CashbackOption.frequentMiles));

    // await tester
    //     .whenDoing(() => bloc.onCityChangePipe.send('New York'))
    //     .thenExpectA(CashbackFormViewModel(
    //         'New York', '', CashbackOption.frequentMiles));

    // await tester.whenDoing(() => bloc.onFormSubmitEvent.launch()).thenExpectA(
    //     CashbackConfirmationViewModel(
    //         'New York', '', CashbackOption.frequentMiles, '12345'));
  });

  test('CashbackBloc onCityUpdate ', () async {
    final useCase = CashbackUsecaseMock();
    final bloc = CashbackBloc(cashbackUsecase: useCase);
    useCase.viewModelPipe = bloc.cashbackFormViewModelPipe;

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenBeingListenedTo().thenExpectAnyModel();

    await tester
        .whenDoing(() => bloc.onCityChangePipe.send('New York'))
        .thenExpectA(CashbackFormViewModel(
            'New York', '', CashbackOption.frequentMiles));
  });

  test('CashbackBloc submit ', () async {
    final useCase = CashbackUsecaseMock();
    final bloc = CashbackBloc(cashbackUsecase: useCase);
    useCase.viewModelPipe = bloc.cashbackFormViewModelPipe;

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenDoing(() => bloc.onFormSubmitEvent.launch()).thenExpectA(
        CashbackConfirmationViewModel(
            '', '', CashbackOption.storesDiscount, 'fake1234'));
  });
}

class CashbackUsecaseMock extends Mock implements CashbackUsecase {
  late Pipe _viewModelPipe;

  set viewModelPipe(Pipe viewModelPipe) => _viewModelPipe = viewModelPipe;

  @override
  void getCurrentState() {
    _viewModelPipe.send(
        CashbackFormViewModel('test', 'test', CashbackOption.frequentMiles));
  }

  @override
  void onCityUpdate(String newCityValue) {
    _viewModelPipe.send(
        CashbackFormViewModel(newCityValue, '', CashbackOption.frequentMiles));
  }

  @override
  void submitCashbackForm() async {
    _viewModelPipe.send(CashbackConfirmationViewModel(
        '', '', CashbackOption.storesDiscount, 'fake1234'));
  }
}
