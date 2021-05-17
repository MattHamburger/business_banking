// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/bloc/credit_card_usecase.dart';
import 'package:business_banking/features/credit_card/bloc/payment_request/credit_card_payment_request_usecase.dart';
import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CreditCardUseCaseMock extends Mock implements CreditCardUseCase {}

class CreditCardPaymentRequestUseCaseMock extends Mock
    implements CreditCardPaymentRequestUseCase {}

void main() {
  test('CreditCardBloc initialize', () async {
    final bloc = CreditCardBloc();
    expect(bloc.creditCardViewEventsPipe, isNotNull);
    expect(bloc.creditCardViewModelPipe, isNotNull);
    expect(bloc.creditCardPaymentRequestViewModelPipe, isNotNull);
    expect(bloc.creditCardPaymentResponseViewModelPipe, isNotNull);
  });

  test('CreditCardBloc dispose', () async {
    final bloc = CreditCardBloc();
    bloc.dispose();
    expect(bloc.creditCardViewEventsPipe.receive, emitsDone);
    expect(bloc.creditCardViewModelPipe.receive, emitsDone);
    expect(bloc.creditCardPaymentRequestViewModelPipe.receive, emitsDone);
    expect(bloc.creditCardPaymentResponseViewModelPipe.receive, emitsDone);
  });

  test('CreditCardBloc CreditCardUseCase create on pipe listen', () async {
    CreditCardUseCaseMock creditCardUseCaseMock = CreditCardUseCaseMock();
    CreditCardBloc bloc =
        CreditCardBloc(creditCardUseCase: creditCardUseCaseMock);
    bloc.creditCardViewModelPipe.receive.listen((event) {});
    verify(creditCardUseCaseMock.create()).called(1);
  });

  test('CreditCardBloc creditCardViewEventsPipeHandler', () async {
    CreditCardUseCaseMock creditCardUseCaseMock = CreditCardUseCaseMock();
    CreditCardPaymentRequestUseCaseMock creditCardPaymentRequestUseCaseMock =
        CreditCardPaymentRequestUseCaseMock();
    CreditCardBloc bloc = CreditCardBloc(
        creditCardUseCase: creditCardUseCaseMock,
        creditCardPaymentRequestUseCase: creditCardPaymentRequestUseCaseMock);
    var viewModel = CreditCardPaymentRequestViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      paymentValue: 20.00,
    );
    var event = CreditCardViewEventUpdatePaymentValue(viewModel, 0);
    bloc.creditCardViewEventsPipeHandler(event);
    verify(creditCardPaymentRequestUseCaseMock.updatePaymentValue(any))
        .called(1);
  });

  test('CreditCardBloc validatePaymentInformation', () async {
    CreditCardUseCaseMock creditCardUseCaseMock = CreditCardUseCaseMock();
    CreditCardPaymentRequestUseCaseMock creditCardPaymentRequestUseCaseMock =
        CreditCardPaymentRequestUseCaseMock();
    CreditCardBloc bloc = CreditCardBloc(
        creditCardUseCase: creditCardUseCaseMock,
        creditCardPaymentRequestUseCase: creditCardPaymentRequestUseCaseMock);
    var viewModel = CreditCardPaymentRequestViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      paymentValue: 20.00,
    );
    bloc.validatePaymentInformation(viewModel, 10);
    verify(creditCardPaymentRequestUseCaseMock.validatePaymentInformation(any))
        .called(1);
  });

  test('CreditCardViewEventUpdatePaymentValue', () async {
    var viewModel = CreditCardPaymentRequestViewModel(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      balance: 1234.56,
      paymentDueDate: DateTime.parse("2021-05-03"),
      nextClosingDate: DateTime.parse("2021-05-06"),
      paymentMinimumValue: 100.00,
      paymentValue: 20.00,
    );
    var event = CreditCardViewEventUpdatePaymentValue(viewModel, 0);
    expect(event.props, [viewModel, 0]);
  });
}
