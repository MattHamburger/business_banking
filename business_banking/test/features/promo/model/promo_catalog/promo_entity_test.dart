import 'package:business_banking/features/promo/model/promo_catalog/promo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('PromoEntity initialization', () async {
    final promoEnt = PromoEntity();
    expect(promoEnt.id, '');
    expect(promoEnt.title, '');
    expect(promoEnt.subtitle, '');
    expect(promoEnt.icon, '');
    expect(promoEnt.features, '');
    expect(promoEnt.props, [
      promoEnt.errors,
      promoEnt.id,
      promoEnt.title,
      promoEnt.subtitle,
      promoEnt.features,
      promoEnt.icon
    ]);
  });

  test('PromoEntity merge success', () async {
    final promoEntA = PromoEntity(
      id: 'new_id_A',
      title: 'test_titleA',
      subtitle: 'test_subtitleA',
      features: 'test_featuresA',
      icon: 'test_iconA'
    );

    final promoEntB = promoEntA.merge(
        id: 'new_id_B',
        title: 'test_title_B',
        icon: 'test_iconB') as PromoEntity;

    expect(promoEntB.id, 'new_id_B');
    expect(promoEntB.title, 'test_title_B');
    expect(promoEntB.subtitle, 'test_subtitleA');
    expect(promoEntB.features, 'test_featuresA');
    expect(promoEntB.icon, 'test_iconB');
  });

  test('PromoEntity merge with missing data success', () async {
    final promoEntA = PromoEntity(
        id: 'new_id_A',
        title: 'test_titleA',
        subtitle: 'test_subtitleA',
        features: 'test_featuresA',
        icon: 'test_iconA'
    );

    final promoEntB = promoEntA.merge(
        id: null,
        title: null,
        subtitle: null,
        features: null,
        icon: null) as PromoEntity;

    expect(promoEntB.id, 'new_id_B');
    expect(promoEntB.title, 'test_title_B');
    expect(promoEntB.subtitle, 'test_subtitleA');
    expect(promoEntB.features, 'test_featuresA');
    expect(promoEntB.icon, 'test_iconB');
  });
}