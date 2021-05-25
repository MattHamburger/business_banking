import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdHubCardViewModel initialization', () async {
    final viewModel = AdHubCardViewModel(
        adTitle: 'title',
        adIconImage: 'https://url',
        id: 'someid',
        adImage: 'imageurl',
        adDescription: 'adDesc');
    expect(viewModel.adTitle, 'title');
    expect(viewModel.adIconImage, 'https://url');
    expect(viewModel.adDescription, 'adDesc');
    expect(viewModel.props, [viewModel.adTitle, viewModel.adIconImage]);
  });
}
