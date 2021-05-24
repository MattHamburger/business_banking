import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewCardsEntity extends Entity {
  final List<NewCard>? allCards;

  NewCardsEntity({
    List<EntityFailure> errors = const [],
    List<NewCard>? allCards,
  })  : allCards = allCards,
        super(errors: errors);

  @override
  NewCardsEntity merge({List<EntityFailure>? errors, List<NewCard>? allCards,}) {
    return NewCardsEntity(
      allCards: allCards ?? this.allCards,
      errors: errors ?? this.errors,
    );
  }
}
