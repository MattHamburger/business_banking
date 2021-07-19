// @dart=2.9

import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service.dart';
import 'package:business_banking/features/profile/update_user_profile/api/update_user_profile_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Request, Response;
import 'package:http/testing.dart';

void main() {
  group('UpdateUserProfileService ', () {
    test("Test Success RestAPI call", () async {
      final client = MockClient((Request request) async {
        return Response('{"isProfileUpdated": true}', 200);
      });
      final resp =
          await client.post(Uri.https('test.com', 'update-user-profile'));
      expect(resp.body, '{"isProfileUpdated": true}');
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final client = MockClient((Request request) async {
        return Response('{"isProfileUpdated": false}', 500);
      });
      final resp =
          await client.post(Uri.https('test.com', 'create-new-account'));

      expect(resp.statusCode, 500);
    });

    test('UpdateUserProfileService parseResponse', () async {
      final json = {
        'isProfileUpdated': true,
      };

      final service = UpdateUserProfileService();

      UpdateUserProfileServiceResponseModel response =
          service.parseResponse(json);

      expect(response, UpdateUserProfileServiceResponseModel.fromJson(json));
    });
  });
}
