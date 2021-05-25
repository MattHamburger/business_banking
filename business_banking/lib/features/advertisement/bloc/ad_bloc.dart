import 'package:business_banking/features/advertisement/api/ad_service.dart';
import 'package:business_banking/features/advertisement/bloc/ad_hub_card_use_case.dart';
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class AdBloc extends Bloc {
  final adHubCardViewModelPipe = Pipe<AdHubCardViewModel>();
  AdHubCardUseCase? _useCase;

  AdBloc({AdService? adService}) {
    _useCase =
        AdHubCardUseCase((viewModel) => adHubCardViewModelPipe.send(viewModel));
    adHubCardViewModelPipe.whenListenedDo(() => _useCase!.create());
  }

  @override
  void dispose() {
    adHubCardViewModelPipe.dispose();
  }
}
