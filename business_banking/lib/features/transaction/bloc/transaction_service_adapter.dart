import 'package:business_banking/features/transaction/api/transaction_service.dart';
import 'package:business_banking/features/transaction/api/transaction_service_response_model_list.dart';

import 'package:business_banking/features/transaction/model/transaction_entity.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TransactionServiceAdapter extends ServiceAdapter<TransactionEntity,
    JsonRequestModel, TransactionServiceResponseModelList, TransactionService> {
  TransactionServiceAdapter() : super(TransactionService());

  @override
  TransactionEntity createEntity(TransactionEntity initialEntity,
      TransactionServiceResponseModelList responseModelList) {
    return TransactionEntity(
        transactionDetails: responseModelList
            .transactionDetailEntityModelResponseList
            .map((transactionDetailEntityModelResponse) => TransactionModel(
                transactionTitle:
                    transactionDetailEntityModelResponse.transactionTitle,
                transactionCategory:
                    transactionDetailEntityModelResponse.transactionCategory,
                transactionAmount: double.parse(
                    transactionDetailEntityModelResponse.transactionAmount),
                transactionId:
                    transactionDetailEntityModelResponse.transactionId,
                payTo: transactionDetailEntityModelResponse.payTo,
                debit: transactionDetailEntityModelResponse.debit,
                date: DateTime.fromMillisecondsSinceEpoch(
                    transactionDetailEntityModelResponse.timestamp * 1000)))
            .toList());
  }
}
