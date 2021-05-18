// @dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/core/patch_simple_rest_api.dart';

final String baseUrl = "http://localhost:3001/";

void main() {
  test("PatchSimpleRestAPI get call without parameters", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.get, path: 'transfer-accounts-from');
    expect(resp.type, RestResponseType.success);
    expect(resp.content, """{
  "fromAccounts": ["1111111111", "2222222222", "3333333333" ]
}""");
  });

  test("PatchSimpleRestAPI get call with parameters", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.get,
        path: 'promos/{customerId}',
        requestBody: {"customerId": 123});
    expect(resp.type, RestResponseType.success);
    expect(resp.content, """{
  
  "imageUrl":"https://via.placeholder.com/300",
  "externalUrl": "https://www.huntington.com/"
}""");
  });

  test("PatchSimpleRestAPI post call without parameters", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.post, path: 'transfer-accounts-to');
    expect(resp.type, RestResponseType.success);
    expect(resp.content, """{
  "toAccounts": ["4444444444", "5555555555", "6666666666" ]
}""");
  });

  test("PatchSimpleRestAPI get call with missing parameters", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.get, path: 'promos/{customerId}', requestBody: null);
    expect(resp.type, RestResponseType.badRequest);
  });

  test("PatchSimpleRestAPI get call with invaild parameters", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.get,
        path: 'promos/{customer}',
        requestBody: {"customerId": 123});
    expect(resp.type, RestResponseType.badRequest);
  });

  test("PatchSimpleRestAPI get call with 400 response", () async {
    PatchSimpleRestApi api = PatchSimpleRestApi(baseUrl: baseUrl);
    RestResponse resp = await api.request(
        method: RestMethod.get,
        path: 'promos/{customerId}',
        requestBody: {"customerId": 143});
    expect(resp.type, RestResponseType.badRequest);
  });
}
