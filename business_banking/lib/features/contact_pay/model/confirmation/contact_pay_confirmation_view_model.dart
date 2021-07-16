import 'package:clean_framework/clean_framework.dart';

class ContactPayConfirmationViewModel extends ViewModel {
  final String confirmationId;

  ContactPayConfirmationViewModel({required this.confirmationId});

  List<Object?> get props => [confirmationId];
}
