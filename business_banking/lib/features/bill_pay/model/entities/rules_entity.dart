import 'package:business_banking/features/bill_pay/api/models/biller_reponse_model.dart';
import 'package:clean_framework/clean_framework.dart';

class RulesEntity extends Entity {
  final int memoLimit;
  final double paymentMin;
  final double paymentMax;

  RulesEntity({
    List<EntityFailure> errors = const [],
    int memoLimit,
    double paymentMin,
    double paymentMax,
  })  : memoLimit = memoLimit ?? 256,
        paymentMin = paymentMin ?? 0,
        paymentMax = paymentMax ?? 1000,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        memoLimit,
        paymentMin,
        paymentMax,
      ];

  @override
  merge({
    errors,
    int memoLimit,
    double paymentMin,
    double paymentMax,
  }) {
    return RulesEntity(
      errors: errors ?? this.errors,
      memoLimit: memoLimit ?? this.memoLimit,
      paymentMin: paymentMin ?? this.paymentMin,
      paymentMax: paymentMax ?? this.paymentMax,
    );
  }

  @override
  String toString() {
    return "$memoLimit $paymentMin $paymentMax";
  }
}
