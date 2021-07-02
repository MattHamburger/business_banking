import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('PromoHubCardEntity initialization', () async {
    final promoHubCardEnt = PromoEntity();
    expect(promoHubCardEnt.income, '');
    expect(promoHubCardEnt.phone, '');
    expect(promoHubCardEnt.icon, '');
    expect(promoHubCardEnt.promotions, []);
    expect(promoHubCardEnt.props, [
      promoHubCardEnt.errors,
      promoHubCardEnt.income,
      promoHubCardEnt.phone,
      promoHubCardEnt.icon,
      promoHubCardEnt.promotions
    ]);
  });

  test('PromoHubCardEntity merge success', () async {
    final promoEntA = PromoEntity(
        income: '100',
        phone: '3103100310',
        icon: 'icon_url'
    );

    final promoEntB = promoEntA.merge(
        income: '200',
        phone: '5005005050',
        icon: 'icon_url_b') as PromoEntity;

    expect(promoEntB.income, '200');
    expect(promoEntB.phone, '5005005050');
    expect(promoEntB.icon, 'icon_url_b');
  });

  test('PromoHubCardEntity merge with missing data success', () async {
    final promoEntA = PromoEntity(
        income: '100',
        phone: '3103100310',
        icon: 'icon_url'
    );

    final promoEntB = promoEntA.merge(
        income: null,
        phone: null,
        icon: null) as PromoEntity;

    expect(promoEntB.income, '100');
    expect(promoEntB.phone, '3103100310');
    expect(promoEntB.icon, 'icon_url');
  });
}