import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoBloc extends Bloc {
  final promoHubCardViewModelPipe = Pipe<PromoHubCardViewModel>();
  PromoHubCardUseCase _useCase;

  PromoBloc({PromoService adService}) {
    _useCase =
        PromoHubCardUseCase((viewModel) => promoHubCardViewModelPipe.send(viewModel));
    promoHubCardViewModelPipe.whenListenedDo(() => _useCase.create());
  }

  @override
  void dispose() {
    promoHubCardViewModelPipe.dispose();
  }
}