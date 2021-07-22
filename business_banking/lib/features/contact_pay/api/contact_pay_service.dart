import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

// EitherService enforces certain rules on how to invoke the service to check if it is successful or if it fails
class ContactPayService
    extends EitherService<ContactPayRequestModel, ContactPayResponseModel> {
  ContactPayService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().simpleApi,
            path: 'contact-pay-send');

  @override
  ContactPayResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return ContactPayResponseModel.fromJson(jsonResponse);
  }
}

class ContactPayResponseModel extends JsonResponseModel {
  final String confirmationId;
  final int errorCode;

  ContactPayResponseModel.fromJson(Map<String, dynamic> json)
      : confirmationId = json['confirmationId'] ?? '',
        errorCode = json['errorCode'] ?? 1;

  @override
  List<Object?> get props => [confirmationId, errorCode];
}

// {
//   paymentAmount: 425.50,
//   contactEmail: "johncdoe@gmail.com"
// }

class ContactPayRequestModel extends JsonRequestModel {
  final double paymentAmount;
  final String contactEmail;

  ContactPayRequestModel({
    required this.paymentAmount,
    required this.contactEmail,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'paymentAmount': paymentAmount,
      'contactEmail': contactEmail,
    };
  }
}
