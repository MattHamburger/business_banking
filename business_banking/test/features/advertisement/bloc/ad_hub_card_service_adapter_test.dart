import 'package:business_banking/features/advertisement/api/ad_service_response_model.dart';
import 'package:business_banking/features/advertisement/bloc/ad_hub_card_service_adapter.dart';
import 'package:business_banking/features/advertisement/model/ad_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountInfo Service Adapter Test', () {
    final testEntity = AdEntity(
        id: '001',
        adImage: 'imageURL will be here',
        adIconImage: 'iconImageURL will be here',
        adDescription: 'adDescription: Save way more than you expected!',
        adTitle: 'ad Title: Save More!');

    final tJsonResponse = {
      "id": "001",
      "adTitle": "ad Title: Save More!",
      "adDescription": "adDescription: Save way more than you expected!",
      "adImage": "imageURL will be here",
      "adIconImage": "iconImageURL will be here"
    };

    test('Correct service adapter serialization', () async {
      final entity = AdHubCardServiceAdapter().createEntity(
          testEntity, AdServiceResponseModel.fromJson(tJsonResponse));
      expect(entity, testEntity);
    });
  });
}
