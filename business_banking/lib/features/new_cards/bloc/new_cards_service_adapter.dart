import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:business_banking/features/new_cards/api/new_cards_service.dart';
import 'package:business_banking/features/new_cards/models/new_cards_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewCardsServiceAdapter extends ServiceAdapter<NewCardsEntity, JsonRequestModel,
    NewCardsResponseModel, NewCardsService> {
  NewCardsServiceAdapter() : super(NewCardsService());

  @override
  NewCardsEntity createEntity(
    NewCardsEntity initialEntity,
    NewCardsResponseModel responseModel,
  ) {
    return initialEntity.merge(allCards: responseModel.allCards);
  }

}
