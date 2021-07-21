import 'package:clean_framework/clean_framework.dart';

class ContactPayEntity extends Entity {
  final double paymentAmount;
  final String contactEmail;
  final String confirmationId;
  final int errorCode;

  ContactPayEntity(
      {this.paymentAmount = 0.0,
      this.contactEmail = "",
      this.confirmationId = "",
      this.errorCode = 1});

  List<Object?> get props =>
      [paymentAmount, contactEmail, confirmationId, errorCode];

  @override
  ContactPayEntity merge(
      {List<EntityFailure>? errors,
      double? paymentAmount,
      String? contactEmail,
      String? confirmationId,
      int? errorCode}) {
    return ContactPayEntity(
        paymentAmount: paymentAmount ?? this.paymentAmount,
        contactEmail: contactEmail ?? this.contactEmail,
        confirmationId: confirmationId ?? this.confirmationId,
        errorCode: errorCode ?? this.errorCode);
  }
}
