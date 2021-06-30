import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoBloc extends Bloc {
  final promoHubCardViewModelPipe = Pipe<PromoHubCardViewModel>();
  final promoHubCardEventsPipe = Pipe<PromoHubCardEvent>(canSendDuplicateData: true);
  late PromoHubCardUseCase _useCase;

  PromoBloc({PromoHubCardService? promoService}) {
    print('initializing bloc');
    _useCase =
        PromoHubCardUseCase((viewModel) => promoHubCardViewModelPipe
            .send(viewModel as PromoHubCardViewModel));

    promoHubCardViewModelPipe
        .whenListenedDo(() => _useCase.execute());

    promoHubCardEventsPipe.receive.listen((event) {
      print(event.toString());
      print('event?');
      handlePromoHubCardEvent(event);
    });
    print('assiging use case');



  }

  void handlePromoHubCardEvent(PromoHubCardEvent event) {
    print('pipeHandlerEvent:' + event.toString());
    if (event is UpdateIncomeEvent) {
      _useCase.updateIncome(event.income);
      return;
    } else if (event is UpdatePhoneEvent) {
      _useCase.updatePhone(event.phone);
      return;
    }
  }

  String validateIncome(String income) {
    return _useCase.validateIncomeFieldInput(income);
  }

  String validatePhone(String phone) {
    return _useCase.validatePhoneFieldInput(phone);
  }

  @override
  void dispose() {
    promoHubCardViewModelPipe.dispose();
    promoHubCardEventsPipe.dispose();
  }
}