import 'package:clean_framework/clean_framework.dart';

class BillPayCardEntity extends Entity {
  final int billsDue;

  BillPayCardEntity({
    List<EntityFailure> errors = const [],
    int? billsDue,
  })  : billsDue = billsDue ?? 0,
        super(errors: errors);

  @override
  List<Object> get props => [errors, billsDue];

  @override
  BillPayCardEntity merge({
    List<EntityFailure>? errors,
    int? billsDue,
  }) {
    return BillPayCardEntity(
      errors: errors ?? this.errors,
      billsDue: billsDue ?? this.billsDue,
    );
  }
}
