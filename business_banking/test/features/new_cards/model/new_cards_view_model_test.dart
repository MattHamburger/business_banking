import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:business_banking/features/new_cards/models/new_cards_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('NewCard initialize', () async {
    final viewModel = NewCard(cardId: 1, expiry: "b", holder: "c", number: "d");
    expect(viewModel.expiry, 'b');
    expect(viewModel.holder, 'c');
    expect(viewModel.cardId, 1);
    expect(viewModel.number, "d");

    final viewModel2 = NewCard.fromJson({"card_id": 1, "holder": "a4", "expiry": "d", "number": "d"});
    expect(viewModel2.cardId, 1);
    expect(viewModel2.holder, 'a4');
    expect(viewModel2.expiry, "d");
    expect(viewModel2.number, "d");
  });


  test('NewCardViewModel initialize', () async {
    List<NewCard> cards = List.empty(growable: true);
    cards.add(NewCard(cardId: 1, expiry: "e1", holder: "h1", number: "n1"));
    cards.add(NewCard(cardId: 2, expiry: "e2", holder: "h2", number: "n2"));
    cards.add(NewCard(cardId: 3, expiry: "e3", holder: "h3", number: "n3"));
    cards.add(NewCard(cardId: 4, expiry: "e4", holder: "h4", number: "n4"));
    final viewModel = NewCardsViewModel(allCards: cards);
    expect(viewModel.allCards, cards);
    expect(viewModel.props, [viewModel.allCards]);
  });

}
