import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/new_cards/api/new_cards_response_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewCardsViewModel extends ViewModel {
  final ServiceResponseStatus? serviceStatus;
  final List<NewCard>? allCards;

  NewCardsViewModel({
    this.serviceStatus,
    required this.allCards,
  });

  @override
  List<Object?> get props => [
        allCards,
        serviceStatus,
      ];
}
