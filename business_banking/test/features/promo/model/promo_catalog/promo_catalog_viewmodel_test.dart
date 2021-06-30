import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PromoCatalogViewModel initialization', () async {
    final viewModel = PromoCatalogViewModel(
        promoList: [
          PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1'),
          PromoCatalogItem('id2', 'title2', 'subtitle2', 'features2', 'icon2'),
          PromoCatalogItem('id3', 'title3', 'subtitle3', 'features3', 'icon3'),
          PromoCatalogItem('id4', 'title4', 'subtitle4', 'features4', 'icon4')
        ]);

    final promoListMatcher = [
      PromoCatalogItem( 'id1',  'title1', 'subtitle1',
          'features1', 'icon1'),
      PromoCatalogItem( 'id2',  'title2', 'subtitle2',
          'features2', 'icon2'),
      PromoCatalogItem( 'id3',  'title3', 'subtitle3',
          'features3', 'icon3'),
      PromoCatalogItem( 'id4',  'title4', 'subtitle4',
          'features4', 'icon4')
    ];
    expect(viewModel, PromoCatalogViewModel(promoList: promoListMatcher));
    expect(viewModel.promoList[0], PromoCatalogItem( 'id1',  'title1', 'subtitle1',
        'features1', 'icon1'));
    expect(viewModel.promoList[1], PromoCatalogItem( 'id2',  'title2', 'subtitle2',
        'features2', 'icon2'));
    expect(viewModel.promoList[2], PromoCatalogItem( 'id3',  'title3', 'subtitle3',
        'features3', 'icon3'));
    expect(viewModel.promoList[3], PromoCatalogItem( 'id4',  'title4', 'subtitle4',
        'features4', 'icon4'));
  });
}
