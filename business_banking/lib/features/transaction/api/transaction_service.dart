import 'package:business_banking/features/transaction/api/transaction_service_response_model_list.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class TransactionService extends EitherService<JsonRequestModel,
    TransactionServiceResponseModelList> {
  TransactionService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-transactions');

  @override
  TransactionServiceResponseModelList parseResponse(
      Map<String, dynamic> jsonResponse) {
    return TransactionServiceResponseModelList.fromJson(jsonResponse);
  }
}
