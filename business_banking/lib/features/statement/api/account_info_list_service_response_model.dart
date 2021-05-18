import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountInfoListServiceResponseModel extends JsonResponseModel {
  final List<AccountInfoStruct> accounts;

  AccountInfoListServiceResponseModel.fromJson(Map<String, dynamic> json)
      : accounts = (json["accounts"] as List)
            .map((i) => new AccountInfoStruct.fromJson(i))
            .toList();

  @override
  List<Object> get props => [accounts];
}
