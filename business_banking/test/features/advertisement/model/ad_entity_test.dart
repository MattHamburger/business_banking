import 'package:business_banking/features/advertisement/model/ad_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdEntity initialization', () async {
    final adEntity = AdEntity();
    expect(adEntity.id, '');
    expect(adEntity.adTitle, '');
    expect(adEntity.adDescription, '');
    expect(adEntity.adImage, '');
    expect(adEntity.adIconImage, '');
    expect(adEntity.props, [
      adEntity.errors,
      adEntity.id,
      adEntity.adTitle,
      adEntity.adDescription,
      adEntity.adImage,
      adEntity.adIconImage,
    ]);
  });

  test('AdEntity merge successful', () async {
    final adEntity = AdEntity(
        id: 'id01',
        adTitle: 'title01',
        adDescription: 'description01',
        adImage: 'image-url01',
        adIconImage: 'icon-image-url01');

    final adEntity02 = adEntity.merge(
        id: 'id02',
        adTitle: 'title02',
        adDescription: 'description02',
        adImage: 'image-url02',
        adIconImage: 'icon-image-url02') as AdEntity;

    expect(adEntity02.id, 'id02');
    expect(adEntity02.adTitle, 'title02');
    expect(adEntity02.adDescription, 'description02');
    expect(adEntity02.adImage, 'image-url02');
    expect(adEntity02.adIconImage, 'icon-image-url02');
  });

  test('AdEntity merge with entity with null fields', () async {
    final adEntity = AdEntity(
        id: 'id01',
        adTitle: 'title01',
        adDescription: 'description01',
        adImage: 'image-url01',
        adIconImage: 'icon-image-url01');

    final adEntity02 = adEntity.merge(
        id: null,
        adTitle: null,
        adDescription: null,
        adImage: null,
        adIconImage: null) as AdEntity;

    expect(adEntity02.id, 'id01');
    expect(adEntity02.adTitle, 'title01');
    expect(adEntity02.adDescription, 'description01');
    expect(adEntity02.adImage, 'image-url01');
    expect(adEntity02.adIconImage, 'icon-image-url01');
  });
}
