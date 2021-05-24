import 'package:business_banking/features/deposit_check/api/deposit_check_response_model.dart';
import 'package:business_banking/features/deposit_check/api/deposit_check_request_model.dart';
import 'package:business_banking/features/new_cards/api/new_cards_request_model.dart';
import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewCardsService
    extends EitherService<NewCardsRequestModel, NewCardsResponseModel> {
  NewCardsService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'hub-cards',
        );

  @override
  NewCardsResponseModel parseResponse(
    Map<String, dynamic> jsonResponse,
  ) {
    return NewCardsResponseModel.fromJson(jsonResponse);
  }
}
