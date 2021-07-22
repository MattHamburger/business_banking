import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  // test('CashbackBloc viewModel manual old way', () {
  //   final useCaseMock = CashbackUsecaseMock();
  //   final bloc = CashbackBloc(cashbackUsecase: useCaseMock);
  //   CashbackFormViewModel currentViewModel =
  //       CashbackFormViewModel('', '', CashbackOption.frequentMiles);

  //   bloc.cashbackFormViewModelPipe.receive.listen((viewModel) {
  //     print('callback');
  //     currentViewModel = viewModel;
  //   });

  //   Future.delayed(Duration(milliseconds: 100));

  //   expect(useCaseMock.viewModel,
  //       CashbackFormViewModel('test', 'test', CashbackOption.frequentMiles));
  //   // expect(currentViewModel,
  //   //     CashbackFormViewModel('test', 'test', CashbackOption.frequentMiles));
  // });

  test('CashbackBloc viewModel with tester and no mock', () async {
    final bloc = CashbackBloc();

    await ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe)
        .whenBeingListenedTo()
        .thenExpectA(
            CashbackFormViewModel('', '', CashbackOption.frequentMiles));
  });

  test('CashbackBloc onCityChangePipe with tester and no mock', () async {
    final bloc = CashbackBloc();

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenBeingListenedTo().thenExpectAnyModel();

    await tester
        .whenDoing(() => bloc.onCityChangePipe.send('London'))
        .thenExpectA(
            CashbackFormViewModel('London', '', CashbackOption.frequentMiles));
  });

  test('CashbackBloc onFormSubmitEvent with tester and no mock', () async {
    final bloc = CashbackBloc();

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenBeingListenedTo().thenExpectAnyModel();

    await tester
        .whenDoing(() => bloc.onCityChangePipe.send('New York'))
        .thenExpectA(CashbackFormViewModel(
            'New York', '', CashbackOption.frequentMiles));

    await tester.whenDoing(() => bloc.onFormSubmitEvent.launch()).thenExpectA(
        CashbackConfirmationViewModel(
            'New York', '', CashbackOption.frequentMiles, '12345'));
  });
}

// class CashbackUsecaseMock extends Mock implements CashbackUsecase {
//   late final ViewModelCallback<CashbackFormViewModel> viewModelCallBack;

//   @override
//   void getCurrentState() {
//     viewModelCallBack(
//         CashbackFormViewModel('test', 'test', CashbackOption.frequentMiles));
//   }
// }
