import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';

class StatementCardViewModel extends ViewModel {
  final List<AccountInfoStruct> accounts;
  final serviceResponseStatus;

  StatementCardViewModel(
      {required this.accounts,
      this.serviceResponseStatus = ServiceResponseStatus.unknown});

  @override
  List<Object> get props => [accounts, serviceResponseStatus];
}
