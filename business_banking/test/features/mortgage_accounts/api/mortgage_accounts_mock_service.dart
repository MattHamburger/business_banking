import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:mockito/mockito.dart';

class MortgageAccountsMockService extends Fake implements MortgageAccountsService {
  MortgageAccountsMockService();

  @override
  MortgageAccountsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    print('mockservice');
    return MortgageAccountsServiceResponseModel.fromJson(jsonResponse);
  }
}