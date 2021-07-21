import 'package:business_banking/features/referal/api/referal_request_model.dart';
import 'package:business_banking/features/referal/api/referal_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';

class ReferalService
    extends EitherService<ReferalRequestModel, ReferalResponeModel> {
  ReferalService()
      : super(
            method: RestMethod.post,
            restApi: SimpleRestApi(),
            path: 'referal-email-send');

  @override
  ReferalResponeModel parseResponse(Map<String, dynamic> jsonResponse) {
    // TODO: implement parseResponse
    throw UnimplementedError();
  }
}
