
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service.dart';
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service_response_model.dart';
import 'package:mockito/mockito.dart';

class MortgageAccountDetailMockService extends Fake implements MortgageAccountDetailService {

  MortgageAccountDetailMockService();

  @override
  MortgageAccountDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return MortgageAccountDetailServiceResponseModel.fromJson(jsonResponse);
  }
}