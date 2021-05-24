import 'package:business_banking/features/new_cards/bloc/new_cards_usecase.dart';
import 'package:business_banking/features/new_cards/models/new_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewCardsBloc extends Bloc {
  final getNewCardsViewModelPipe = Pipe<NewCardsViewModel>();
  NewCardsUseCase? _newCardsUseCase;

  NewCardsBloc({NewCardsUseCase? newCardsUseCase}) {
    _newCardsUseCase =
        newCardsUseCase ?? NewCardsUseCase(getNewCardsViewModelPipe.send);
    getNewCardsViewModelPipe.whenListenedDo(_newCardsUseCase!.create);
  }

  @override
  void dispose() {
    getNewCardsViewModelPipe.dispose();
  }
}
