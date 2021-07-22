// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/payment_request/credit_card_payment_request_usecase.dart';
import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:business_banking/features/fixed_deposit/bloc/fixed_deposit_request_usecase.dart';
import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_entity.dart';
import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FixedDepositRequestUseCase useCase;

  test('FixedDepositRequestUseCase create', () async {
    var _viewModel;
    useCase = FixedDepositRequestUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<FixedDepositRequestViewModel>());
  });

  test('FixedDepositRequestEntity contains scope in repository', () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    expect(_scope, isNotNull);
  });

  test('FixedDepositRequestUseCase deposit amount is updated in entity',
      () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onDepositAmountUpdate(1000);
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.depositAmount, 1000);
  });

  test('FixedDepositRequestUseCase tenure is updated in entity', () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onTenureUpdate(6);
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.tenure, 6);
  });
  test('FixedDepositRequestUseCase interest rate is updated in entity',
      () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onInterestRateUpdate(6.5);
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.interestRate, 6.5);
  });
  test('FixedDepositRequestUseCase email address is updated in entity',
      () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onEmailAddressUpdate("a@b.com");
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.emailAddress, "a@b.com");
  });
  test('FixedDepositRequestUseCase nominee name is updated in entity',
      () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onNomineeNameUpdate("nominee");
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.nomineeName, "nominee");
  });
  test('FixedDepositRequestUseCase remarks is updated in entity', () async {
    final RepositoryScope<Entity> _scope =
        ExampleLocator().repository.containsScope<FixedDepositRequestEntity>();
    useCase.onRemarksUpdate("placeholder");
    FixedDepositRequestEntity entity = ExampleLocator().repository.get(_scope);
    expect(entity.remarks, "placeholder");
  });

  test('FixedDepositRequestUseCase onSubmit on valid data', () async {
    FixedDepositRequestViewModel _viewModel;
    useCase = FixedDepositRequestUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    useCase.onSubmit();
    expect(_viewModel.isValidData, isTrue);
  });

  test('FixedDepositRequestUseCase onSubmit on remarks empty', () async {
    FixedDepositRequestViewModel _viewModel;
    useCase = FixedDepositRequestUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    useCase.onRemarksUpdate('');
    useCase.onSubmit();
    expect(_viewModel.isValidData, isFalse);
  });
}
