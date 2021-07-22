import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

void testRestAPISetup(
    {RestResponseType type = RestResponseType.badRequest,
    String content = ''}) {
  ExampleLocator().simpleApi = TestRestApiMock(type, content);
}

class TestRestApiMock extends RestApi {
  late RestResponse<String> _expectedResponse;

  TestRestApiMock(RestResponseType type, String content) {
    _expectedResponse = RestResponse<String>(
      type: type,
      uri: Uri.parse(''),
      content: content,
    );
  }

  @override
  Future<RestResponse> request(
      {required RestMethod method,
      required String path,
      Map<String, dynamic> requestBody = const {}}) async {
    return _expectedResponse;
  }

  @override
  Future<RestResponse> requestBinary(
      {required RestMethod method,
      required String path,
      Map<String, dynamic> requestBody = const {}}) async {
    return _expectedResponse;
  }
}
