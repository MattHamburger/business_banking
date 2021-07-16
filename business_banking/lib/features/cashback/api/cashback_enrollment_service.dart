import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CashbackEnrollmentService extends EitherService<
    CashbackEnrollmentRequestModel, CashbackEnrollmentResponseModel> {
  CashbackEnrollmentService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().simpleApi,
            path: 'cashback-enrollment');

  @override
  CashbackEnrollmentResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return CashbackEnrollmentResponseModel.fromJson(jsonResponse);
  }
}

class CashbackEnrollmentResponseModel extends JsonResponseModel {
  final String confirmationId;
  final int errorCode;

  CashbackEnrollmentResponseModel.fromJson(Map<String, dynamic> json)
      : confirmationId = json['confirmationId'] ?? '',
        errorCode = json['errorCode'] ?? 0;

  @override
  List<Object?> get props => [confirmationId, errorCode];
}

// {
//   address: "1234 Central",
//   city: "New York",
//   enrollmentType: "MILES" | "DISCOUNTS"
// }

class CashbackEnrollmentRequestModel extends JsonRequestModel {
  final String address;
  final String city;
  final CashbackEnrollmentType type;

  CashbackEnrollmentRequestModel({
    required this.address,
    required this.city,
    required this.type,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'enrollmentType': _enrollmentTypeMap[type],
    };
  }

  static final _enrollmentTypeMap = {
    CashbackEnrollmentType.miles: 'MILES',
    CashbackEnrollmentType.discounts: 'DISCOUNTS',
  };
}

enum CashbackEnrollmentType { miles, discounts }
