// @dart=2.9

import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' show Request, Response;

void main() {
  var jsonString = '{"promotions": ['
      '{"id": "id1",'
      '"title": "title1",'
      '"subtitle": "subtitle1",'
      '"features": "features1",'
      '"icon": "icon1"},'
      '{"id": "id2",'
      '"title": "title2",'
      '"subtitle": "subtitle2",'
      '"features": "features2",'
      '"icon": "icon2"},]}';

  test('POST call', () async {
    final client = MockClient((Request request) async {
      return Response(jsonString, 200);
    });

    final response = await client.post(Uri.https('100000', '3103005050'));
    expect(response.body, jsonString);
  });

  test('NewOnlineRegistrationService parseResponse', () async {
    final service = PromoHubCardService();
    var jsonMap = {
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

    PromoResponseModel response = service.parseResponse(jsonMap);

    expect(response, PromoResponseModel.fromJson(jsonMap));
  });
}
