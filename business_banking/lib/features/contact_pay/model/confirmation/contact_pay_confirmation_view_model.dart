import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';

class ContactPayConfirmationViewModel extends ViewModel {
  final String confirmationId;
  final int errorCode;
  final ServiceResponseStatus serviceResponseStatus;

  ContactPayConfirmationViewModel(
      {required this.confirmationId,
      required this.errorCode,
      required this.serviceResponseStatus});

  List<Object?> get props => [confirmationId, errorCode, serviceResponseStatus];
}
