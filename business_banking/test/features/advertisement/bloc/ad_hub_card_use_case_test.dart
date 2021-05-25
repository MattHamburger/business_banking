import 'package:business_banking/features/advertisement/bloc/ad_hub_card_use_case.dart';
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdHubCardUseCase create', () async {
    var _viewModel;
    final useCase = AdHubCardUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<AdHubCardViewModel>());
  });
}
