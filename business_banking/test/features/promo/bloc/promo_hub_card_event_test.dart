import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  final income = '100';
  final phone = '3003003333';

  test('Verify event props', (){
    PromoHubCardEvent event = UpdateIncomeEvent(income);
    expect(event.props, ['100']);
  });

  test('Verify to string', (){
    PromoHubCardEvent event = UpdateIncomeEvent(income);
    expect(event.toString(), 'UpdateIncomeEvent(100)');
  });

  test('Verify UpdatePhoneEvent props', (){
    PromoHubCardEvent event = UpdatePhoneEvent(phone);
    expect(event.props, ['3003003333']);
  });

  test('Verify UpdatePhoneEvent to string', (){
    PromoHubCardEvent event = UpdatePhoneEvent(phone);
    expect(event.toString(), 'UpdatePhoneEvent(3003003333)');
  });
}