import 'package:business_banking/features/investments/api/investments_json_response_model.dart';
import 'package:business_banking/features/investments/api/investments_service.dart';
import 'package:business_banking/features/investments/api/investments_service_request_model.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsDetailsServiceAdapter extends ServiceAdapter<
    InvestmentsDetailsEntity,
    JsonRequestModel,
    InvestmentsJsonResponseModel,
    InvestmentsService> {
  InvestmentsDetailsServiceAdapter() : super(InvestmentsService());

  @override
  InvestmentsServiceRequestModel createRequest(
      InvestmentsDetailsEntity entity) {
    return InvestmentsServiceRequestModel(
      symbol: entity.symbol,
    );
  }

  @override
  InvestmentsDetailsEntity createEntity(InvestmentsDetailsEntity initialEntity,
          InvestmentsJsonResponseModel responseModel) =>
      InvestmentsDetailsEntity(
          symbol: responseModel.quote.symbol, quote: responseModel.quote);
}
