import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('PromoEntity initialization', () async {
    final promoEnt = PromoEntity();
    expect(promoEnt.income, '');
    expect(promoEnt.phone, '');
    expect(promoEnt.icon, '');
    expect(promoEnt.promotions, []);
    expect(promoEnt.props, [
      promoEnt.errors,
      promoEnt.income,
      promoEnt.phone,
      promoEnt.icon,
      promoEnt.promotions
    ]);
  });

  test('PromoEntity merge success', () async {
    final promoEntA = PromoEntity(
      income: '100',
      phone: '3103105050',
      promotions: [],
      icon: 'test_iconA'
    );

    final promoEntB = promoEntA.merge(
        income: '200',
        phone: '55055555555',
        promotions: [PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1')],
        icon: 'test_iconB') as PromoEntity;

    expect(promoEntB.income, '200');
    expect(promoEntB.phone, '55055555555');
    expect(promoEntB.promotions, [PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1')]);
    expect(promoEntB.icon, 'test_iconB');
  });

  test('PromoEntity merge with missing data success', () async {
    final promoEntA = PromoEntity(
        income: '100',
        phone: '3103105050',
        promotions: [PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1')],
        icon: 'test_icon_A'
    );

    final promoEntB = promoEntA.merge(
        income: null,
        phone: null,
        promotions: null,
        icon: null
    ) as PromoEntity;

    expect(promoEntB.income, '100');
    expect(promoEntB.phone, '3103105050');
    expect(promoEntB.promotions, [PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1')]);
    expect(promoEntB.icon, 'test_icon_A');
  });
}