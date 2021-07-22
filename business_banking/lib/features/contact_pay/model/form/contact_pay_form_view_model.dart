import 'package:clean_framework/clean_framework.dart';

class ContactPayFormViewModel extends ViewModel {
  final double paymentAmount;
  final String contactEmail;

  ContactPayFormViewModel(
      {required this.paymentAmount, required this.contactEmail});

  List<Object?> get props => [paymentAmount, contactEmail];
}
