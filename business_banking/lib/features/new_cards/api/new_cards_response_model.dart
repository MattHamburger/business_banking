import 'package:clean_framework/clean_framework_defaults.dart';

class NewCardsResponseModel extends JsonResponseModel {
  final List<NewCard> allCards;

  NewCardsResponseModel(this.allCards);

  NewCardsResponseModel.fromJson(Map<String, dynamic> json)
      : allCards = (json["cards"] as List)
            .map((i) => new NewCard.fromJson(i))
            .toList();

  @override
  List<Object> get props => [allCards];

  @override
  bool get stringify => false;
}

class NewCard {
  String number;
  String holder;
  String expiry;
  int cardId;

  NewCard({
    required this.number,
    required this.holder,
    required this.expiry,
    required this.cardId,
  });

  factory NewCard.fromJson(Map<String, dynamic> json) => new NewCard(
        number: json["number"] ?? '',
        holder: json["holder"] ?? '',
        expiry: json["expiry"] ?? '',
        cardId: json["card_id"],
      );
}
