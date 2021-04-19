import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TransactionEntity extends Entity {
  final List<TransactionModel> transactionDetails;

  TransactionEntity({
    List<EntityFailure> errors = const [],
    List<TransactionModel> transactionDetails = const [],
  })  : transactionDetails = transactionDetails,
        super(errors: errors);

  @override
  List<Object> get props => [errors, transactionDetails];

  @override
  merge({errors, String name, String lastFour, double balance}) {
    return TransactionEntity(
      errors: errors ?? this.errors,
      transactionDetails: transactionDetails ?? this.transactionDetails,
    );
  }
}
