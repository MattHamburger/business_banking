import 'package:business_banking/features/investments/api/investments_json_response_model.dart';
import 'package:business_banking/features/investments/api/investments_service.dart';
import 'package:business_banking/features/investments/model/investments_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsServiceAdapter extends ServiceAdapter<InvestmentsEntity,
    JsonRequestModel, InvestmentsJsonResponseModel, InvestmentsService> {
  InvestmentsServiceAdapter() : super(InvestmentsService());

  @override
  InvestmentsEntity createEntity(InvestmentsEntity initialEntity,
          InvestmentsJsonResponseModel responseModel) =>
      InvestmentsEntity(askPrice: responseModel.quote.askPrice);
}
