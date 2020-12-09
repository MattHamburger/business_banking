import 'package:business_banking/features/bill_pay/api/models/account_reponse_model.dart';
import 'package:business_banking/features/bill_pay/api/models/bill_pay_info_response_model.dart';
import 'package:business_banking/features/bill_pay/api/models/biller_reponse_model.dart';
import 'package:business_banking/features/bill_pay/api/models/rules_response_model.dart';
import 'package:business_banking/features/bill_pay/api/services/bill_pay_info_service.dart';
import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/bill_pay_info_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayInfoServiceAdapter extends ServiceAdapter<BillPayInfoEntity,
    JsonRequestModel, BillPayInfoResponseModel, BillPayInfoService> {
  BillPayInfoServiceAdapter() : super(BillPayInfoService());

  @override
  BillPayInfoEntity createEntity(
      BillPayInfoEntity initialEntity, BillPayInfoResponseModel responseModel) {
    RulesResponseModel rulesResp = responseModel.rules;
    List<AccountResponseModel> accountsResp = responseModel.accounts;
    List<BillerResponseModel> billersResp = responseModel.billers;

    return BillPayInfoEntity(
      accounts: accountsResp.map(
        (AccountResponseModel res) => AccountEntity(
          accountTitle: res.accountTitle,
          accountNumber: res.accountNumber,
          accountBalance: res.accountBalance,
          accountStatus: res.accountStatus,
        ),
      ).toList(),
      billers: billersResp.map(
        (BillerResponseModel res) => BillerEntity(
          billerName: res.billerName,
          accountNumber: res.accountNumber,
        ),
      ).toList(),
      rules: RulesEntity(
        memoLimit: rulesResp.memoLimit,
        paymentMin: rulesResp.paymentMin,
        paymentMax: rulesResp.paymentMax,
      ),
    );
  }
}
