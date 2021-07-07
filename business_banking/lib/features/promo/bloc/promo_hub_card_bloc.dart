import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoBloc extends Bloc {
  final promoHubCardViewModelPipe = Pipe<PromoHubCardViewModel>();
  final promoHubCardEventsPipe = Pipe<PromoHubCardEvent>(canSendDuplicateData: true);
  late PromoHubCardUseCase _useCase;
  var recentUpdate = '';

  PromoBloc({PromoHubCardService? promoService,
    PromoHubCardUseCase? useCase,
  }) {
    _useCase = useCase ??
        PromoHubCardUseCase((viewModel) => promoHubCardViewModelPipe
            .send(viewModel as PromoHubCardViewModel));

    promoHubCardViewModelPipe
        .whenListenedDo(() => _useCase.execute());

    promoHubCardEventsPipe.receive.listen((event) {
      handlePromoHubCardEvent(event);
    });
  }

  void handlePromoHubCardEvent(PromoHubCardEvent event) {
    if (event is UpdateFormEvent) {
      _useCase.updateInput(event.income, event.phone);
    }
  }

  Map<String, String> validateForm(String income, String phone) {
    return _useCase.validateForm(income, phone);
  }

  @override
  void dispose() {
    promoHubCardViewModelPipe.dispose();
    promoHubCardEventsPipe.dispose();
  }
}
