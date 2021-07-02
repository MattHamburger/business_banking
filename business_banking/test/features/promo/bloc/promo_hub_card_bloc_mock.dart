import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class PromoBlocMock extends Mock implements PromoBloc {
  @override
  final promoHubCardViewModelPipe = Pipe<PromoHubCardViewModel>();

  @override
  final promoHubCardEventsPipe =
  Pipe<PromoHubCardEvent>(canSendDuplicateData: true);

  PromoHubCardViewModel promoHubCardViewModel =
      PromoHubCardViewModel(
          income: '100',
          incomeFieldStatus: '',
          phone: '3103103311',
          phoneFieldStatus: '',
          icon: ''
      );

  PromoBlocMock() {
    promoHubCardViewModelPipe.whenListenedDo((){
      promoHubCardViewModelPipe.send(promoHubCardViewModel);
    });
  }
}