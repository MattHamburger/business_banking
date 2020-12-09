import 'package:business_banking/features/bill_pay/api/models/biller_reponse_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BillerEntity extends Entity {
  final String billerName;
  final String accountNumber;

  BillerEntity({
    List<EntityFailure> errors = const [],
    String billerName,
    String accountNumber,
  })  : billerName = billerName ?? "Company",
        accountNumber = accountNumber ?? "0000",

        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    billerName,
    accountNumber,
  ];

  @override
  merge({
    errors,
     String billerName,
     String accountNumber,

  }) {
    return BillerEntity(
      errors: errors ?? this.errors,
      billerName: billerName,
      accountNumber: accountNumber
    );
  }

  @override
  String toString() {
    return "$billerName $accountNumber";
  }
}
