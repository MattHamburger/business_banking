import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:business_banking/features/promo/model/promo_catalog/promo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PromoCatalogViewModel initialization', () async {
    final viewModel = PromoCatalogViewModel(
        promoList: [
          PromoCatalogItem(id: 'id1', title: 'title1', subtitle: 'subtitle1',
              features: 'features1', icon: 'icon1'),
          PromoCatalogItem(id: 'id2', title: 'title2', subtitle: 'subtitle2',
              features: 'features2', icon: 'icon2'),
          PromoCatalogItem(id: 'id3', title: 'title3', subtitle: 'subtitle3',
              features: 'features3', icon: 'icon3'),
          PromoCatalogItem(id: 'id4', title: 'title4', subtitle: 'subtitle4',
              features: 'features4', icon: 'icon4')
        ]);

    final promoListMatcher = [
      PromoCatalogItem(id: 'id1', title: 'title1', subtitle: 'subtitle1',
          features: 'features1', icon: 'icon1'),
      PromoCatalogItem(id: 'id2', title: 'title2', subtitle: 'subtitle2',
          features: 'features2', icon: 'icon2'),
      PromoCatalogItem(id: 'id3', title: 'title3', subtitle: 'subtitle3',
          features: 'features3', icon: 'icon3'),
      PromoCatalogItem(id: 'id4', title: 'title4', subtitle: 'subtitle4',
          features: 'features4', icon: 'icon4')
    ];
    expect(viewModel, PromoCatalogViewModel(promoList: promoListMatcher));
    expect(viewModel.promoList[0], PromoCatalogItem(id: 'id1', title: 'title1', subtitle: 'subtitle1',
        features: 'features1', icon: 'icon1'));
    expect(viewModel.promoList[1], PromoCatalogItem(id: 'id2', title: 'title2', subtitle: 'subtitle2',
        features: 'features2', icon: 'icon2'));
    expect(viewModel.promoList[2], PromoCatalogItem(id: 'id3', title: 'title3', subtitle: 'subtitle3',
        features: 'features3', icon: 'icon3'));
    expect(viewModel.promoList[3], PromoCatalogItem(id: 'id4', title: 'title4', subtitle: 'subtitle4',
        features: 'features4', icon: 'icon4'));
  });
}
