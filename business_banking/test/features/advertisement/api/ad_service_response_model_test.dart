import 'package:business_banking/features/advertisement/api/ad_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdServiceResponseModel fromJson initialization', () async {
    final viewModel = AdServiceResponseModel.fromJson({
      'id': 'id01',
      'adTitle': 'Amazing Deal',
      'adDescription': 'details about the deal',
      'adImage': 'https://image.url',
      'adIconImage': 'https://icon-image.url'
    });
    expect(viewModel.id, 'id01');
    expect(viewModel.adTitle, 'Amazing Deal');
    expect(viewModel.adDescription, 'details about the deal');
    expect(viewModel.adIconImage, 'https://icon-image.url');
    expect(viewModel.adImage, 'https://image.url');
    expect(viewModel.props, [
      viewModel.id,
      viewModel.adTitle,
      viewModel.adDescription,
      viewModel.adImage,
      viewModel.adIconImage,
    ]);
  });
  test('AdServiceResponseModel default constructor initialization', () async {
    final viewModel = AdServiceResponseModel(
        'id01',
        'Amazing Deal',
        'details about the deal',
        'https://icon-image.url',
        'https://image.url');

    expect(viewModel.id, 'id01');
    expect(viewModel.adTitle, 'Amazing Deal');
    expect(viewModel.adDescription, 'details about the deal');
    expect(viewModel.adIconImage, 'https://icon-image.url');
    expect(viewModel.adImage, 'https://image.url');
    expect(viewModel.props, [
      viewModel.id,
      viewModel.adTitle,
      viewModel.adDescription,
      viewModel.adImage,
      viewModel.adIconImage,
    ]);
  });
}
