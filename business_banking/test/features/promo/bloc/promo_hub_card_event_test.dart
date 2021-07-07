import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  final income = '100';
  final phone = '3003003333';

  test('Verify event props', (){
    PromoHubCardEvent event = UpdateFormEvent(income, phone);
    expect(event.props, ['100', '3003003333']);
  });

  test('Verify to string', (){
    PromoHubCardEvent event = UpdateFormEvent(income, phone);
    expect(event.toString(), 'UpdateFormEvent(100, 3003003333)');
  });
}
