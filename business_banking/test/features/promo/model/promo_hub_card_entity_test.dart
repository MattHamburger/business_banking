import 'package:business_banking/features/promo/model/promo_hub_card_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('PromoHubCardEntity initialization', () async {
    final promoHubCardEnt = PromoHubCardEntity();
    expect(promoHubCardEnt.income, '');
    expect(promoHubCardEnt.phone, '');
    expect(promoHubCardEnt.icon, '');
    expect(promoHubCardEnt.props, [
      promoHubCardEnt.errors,
      promoHubCardEnt.income,
      promoHubCardEnt.phone,
      promoHubCardEnt.icon,
    ]);
  });

  test('PromoHubCardEntity merge success', () async {
    final promoEntA = PromoHubCardEntity(
        income: '100',
        phone: '3103100310',
        icon: 'icon_url'
    );

    final promoEntB = promoEntA.merge(
        income: '200',
        phone: '5005005050',
        icon: 'icon_url_b') as PromoHubCardEntity;

    expect(promoEntB.income, '200');
    expect(promoEntB.phone, '5005005050');
    expect(promoEntB.icon, 'icon_url_b');
  });

  test('PromoHubCardEntity merge with missing data success', () async {
    final promoEntA = PromoHubCardEntity(
        income: '100',
        phone: '3103100310',
        icon: 'icon_url'
    );

    final promoEntB = promoEntA.merge(
        income: null,
        phone: null,
        icon: null) as PromoHubCardEntity;

    expect(promoEntB.income, '100');
    expect(promoEntB.phone, '3103100310');
    expect(promoEntB.icon, 'icon_url');
  });
}