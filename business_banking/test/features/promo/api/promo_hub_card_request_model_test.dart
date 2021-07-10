import 'package:business_banking/features/promo/api/promo_hub_card_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final requestModel = PromoRequestModel(income: '100000', phone: '3105503030');

  test('PromoRequestModel initialization', () async {
    expect(requestModel.income, '100000');
    expect(requestModel.phone, '3105503030');
  });

  test('PromoRequestModel toJson ', () async {
    expect(requestModel.toJson(), {'income': '100000', 'phone': '3105503030'});
  });

  test('PromoRequestModel toJson empty object', () async {
    final requestModel = PromoRequestModel(income: '', phone: '');
    expect(requestModel.toJson(), {'income': '', 'phone': ''});
  });

  test('PromoRequestModel props',() async {
    expect(requestModel.props, ['100000','3105503030']);
  });
}
