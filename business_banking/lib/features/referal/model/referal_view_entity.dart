import 'package:clean_framework/clean_framework.dart';

class ReferalEntity extends Entity {
  double amountToBeGained;
  final String referalEmail;

  ReferalEntity({
    List<EntityFailure> errors = const [],
    this.amountToBeGained = 0,
    this.referalEmail = "",
  });
  List<Object?> get props => [amountToBeGained, referalEmail];

  @override
  ReferalEntity merge({
    List<EntityFailure>? errors,
    double? amountToBeGained,
    String? referalEmail,
  }) {
    return ReferalEntity(
      amountToBeGained: amountToBeGained ?? this.amountToBeGained,
      referalEmail: referalEmail ?? this.referalEmail,
    );
  }
}
