// @dart=2.9

import 'package:business_banking/features/promo/api/promo_hub_card_request_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_service_adapter.dart';
import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Promo Service Adapter tests',(){

    final promoEntity = PromoEntity(
      income: '10000',
      phone: '3003003030',
      promotions: [
          PromoCatalogItem('id1', 'title1', 'subtitle1', 'features1', 'icon1'),
          PromoCatalogItem('id2', 'title2', 'subtitle2', 'features2', 'icon2'),
      ]
    );

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

    test('should received a json response and return promotions',
            () async {
          final entity = PromoHubCardServiceAdapter().createEntity(
              PromoEntity(),
              PromoResponseModel.fromJson(json));
          expect(entity.promotions, promoEntity.promotions);
        });
  });
}
