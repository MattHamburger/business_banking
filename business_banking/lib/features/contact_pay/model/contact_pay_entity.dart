import 'package:clean_framework/clean_framework.dart';

class ContactPayEntity extends Entity {
  final double paymentAmount;
  final String contactEmail;
  final String confirmationId;

  ContactPayEntity(
      {this.paymentAmount = 0.0,
      this.contactEmail = "",
      this.confirmationId = ""});

  List<Object?> get props => [paymentAmount, contactEmail, confirmationId];

  @override
  ContactPayEntity merge({
    List<EntityFailure>? errors,
    double? paymentAmount,
    String? contactEmail,
    String? confirmationId,
  }) {
    return ContactPayEntity(
        paymentAmount: paymentAmount ?? this.paymentAmount,
        contactEmail: contactEmail ?? this.contactEmail,
        confirmationId: confirmationId ?? this.confirmationId);
  }
}
