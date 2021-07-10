import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final responseModel = PromoResponseModel([
    PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1'),
    PromoCatalogItem('id2', 'title2', 'subtitle2', 'features2', 'icon2'),
    PromoCatalogItem('id3', 'title3', 'subtitle3', 'features3', 'icon3'),
    PromoCatalogItem('id4', 'title4', 'subtitle4', 'features4', 'icon4')
  ]);

  test('PromoResponseModel initialization', () async {
    expect(
        responseModel,
        PromoResponseModel([
          PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1'),
          PromoCatalogItem('id2', 'title2', 'subtitle2', 'features2', 'icon2'),
          PromoCatalogItem('id3', 'title3', 'subtitle3', 'features3', 'icon3'),
          PromoCatalogItem('id4', 'title4', 'subtitle4', 'features4', 'icon4')
        ]));
  });

  test('PromoResponseModel fromJson', () async {
    var json = {
      "promotions": [
        {
          "id": "id1",
          "title": "title1",
          "subtitle": "subtitle1",
          "features": "features1",
          "icon": "icon1"
        },
        {
          "id": "id2",
          "title": "title2",
          "subtitle": "subtitle2",
          "features": "features2",
          "icon": "icon2"
        },
      ]
    };
    final responseModel = PromoResponseModel.fromJson(json);

    expect(responseModel.promotions, [
      PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1'),
      PromoCatalogItem('id2', 'title2', 'subtitle2', 'features2', 'icon2'),
    ]);
    expect(responseModel.props, [responseModel.promotions]);
  });
}
