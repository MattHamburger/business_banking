import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

import '../model/offers_view_model.dart';
import 'offers_usecase.dart';

class OffersBloc extends Bloc {
  late OffersUseCase _offersUseCase;

  @visibleForTesting
  OffersUseCase get offersUseCase => _offersUseCase;

  final offersViewModelPipe = Pipe<OffersViewModel>();

  OffersBloc({OffersUseCase? offersUseCase}) {
    _offersUseCase = offersUseCase ??
        OffersUseCase(
          (viewModel) => offersViewModelPipe.send(viewModel as OffersViewModel),
        );
    offersViewModelPipe.whenListenedDo(_offersUseCase.execute);
  }

  @override
  void dispose() {
    offersViewModelPipe.dispose();
  }
}
