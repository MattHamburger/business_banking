import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoBloc extends Bloc {
  final promoHubCardViewModelPipe = Pipe<PromoHubCardViewModel>();
  late PromoHubCardUseCase _useCase;

  PromoBloc({required PromoHubCardService promoService}) {
    _useCase =
        PromoHubCardUseCase((viewModel) => promoHubCardViewModelPipe.send(viewModel));
    promoHubCardViewModelPipe.whenListenedDo(() => _useCase.execute());
  }

  String validateIncome(String income) {
    return _useCase.validateIncomeFieldInput(income);
  }

  void validatePhone(String phone) {
    return _useCase.validatePhoneFieldInput(phone);
  }

  @override
  void dispose() {
    promoHubCardViewModelPipe.dispose();
  }
}