// @dart=2.9
import 'package:business_banking/features/deposit_check/bloc/1st_hub_card/deposit_check_card_usecase.dart';
import 'package:business_banking/features/deposit_check/bloc/2nd_data_entry/deposit_check_usecase.dart';
import 'package:business_banking/features/deposit_check/bloc/3rd_request_confirmation/deposit_check_confirmation_usecase.dart';
import 'package:mockito/mockito.dart';

class MockDepositCheckCardUseCase extends Mock
    implements DepositCheckCardUseCase {}

class MockDepositCheckUseCase extends Mock implements DepositCheckUseCase {}

class MockDepositCheckConfirmUseCase extends Mock
    implements DepositCheckConfirmUseCase {}
