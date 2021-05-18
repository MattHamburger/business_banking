// @dart=2.9
import 'package:business_banking/features/deposit_check/model/1st_hub_card/deposit_check_card_view_model.dart';
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/bloc/hub_cards/statement_cards_use_case.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_entity.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  StatementCardUseCase useCase;
  StatementCardViewModel statementCardViewModel;

  setUp(() {
    useCase = StatementCardUseCase((viewModel) {
      statementCardViewModel = viewModel;
      return true;
    });
  });

  group('Statement Card Usecase', () {
    final tAccountListInfo = [
      AccountInfoStruct(
          accountNickname: 'Checking Account (...6917)',
          accountNumber: '1234567890126917',
          availableBalance: 481.84,
          depositLimit: 4500.0),
      AccountInfoStruct(
          accountNickname: 'Wells Fargo (6537)',
          accountNumber: '12345678932246917',
          availableBalance: 1441.84,
          depositLimit: 4500.00),
    ];

    final tSucceedAccountInfo = StatementCardViewModel(
        accounts: tAccountListInfo,
        serviceResponseStatus: ServiceResponseStatus.succeed);

    final tStatementCardEntity = StatementCardEntity(
        accountInfoStructs: tAccountListInfo, errors: [EntityFailure()]);
    test('should callback return viewModel the same as source value', () async {
      await useCase.create();

      expect(
        statementCardViewModel,
        tSucceedAccountInfo,
      );
    });

    test('should callback return viewModel without recreate new scope',
        () async {
      await useCase.create();

      expect(statementCardViewModel, isA<StatementCardViewModel>());
      useCase.create();
    });
    test(
        'should service response be failed when built view model with entity that has error',
        () async {
      statementCardViewModel = useCase.buildViewModel(tStatementCardEntity);

      expect(statementCardViewModel.serviceResponseStatus,
          ServiceResponseStatus.failed);
    });
  });
}
