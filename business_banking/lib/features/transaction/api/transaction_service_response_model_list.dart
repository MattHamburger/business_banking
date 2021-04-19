import 'package:business_banking/features/transaction/api/transaction_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TransactionServiceResponseModelList extends Equatable
    implements JsonResponseModel {
  final List<TransactionServiceResponseModel>
      transactionDetailEntityModelResponseList;

  TransactionServiceResponseModelList.fromJson(Map<String, dynamic> json)
      : transactionDetailEntityModelResponseList =
            List<TransactionServiceResponseModel>.from(
                  json['accountTransactions']?.map((transactionsJSONObject) =>
                      TransactionServiceResponseModel.fromJson(
                          transactionsJSONObject)),
                ) ??
                [];

  @override
  List<Object> get props => [transactionDetailEntityModelResponseList];
}
