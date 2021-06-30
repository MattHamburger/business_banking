import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PromoHubCardViewModel initialization', () async {
    final viewModel = PromoHubCardViewModel(
        income: '100\$', phone: '3101133310', icon: 'icon_url', phoneFieldStatus: '', incomeFieldStatus: '');
    expect(viewModel.income, '100\$');
    expect(viewModel.phone, '3101133310');
    expect(viewModel.icon, 'icon_url');
    expect(viewModel.props, [viewModel.income, viewModel.phone, viewModel.icon]);
  });
}
