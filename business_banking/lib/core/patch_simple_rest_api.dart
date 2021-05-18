import 'dart:async';
import 'dart:io';

import 'package:clean_framework/clean_framework.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class PatchSimpleRestApi extends RestApi {
  final baseUrl;
  final bool _trustSelfSigned = true;

  String? _path;
  String? path;

  HttpClient? _httpClient;
  late IOClient _ioClient;

  PatchSimpleRestApi({this.baseUrl = 'http://127.0.0.1:8080/service/'}) {
    _httpClient = new HttpClient()
      //@TODO should we remove this? Not sure if its safe for release
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => _trustSelfSigned);
    _ioClient = new IOClient(_httpClient);
  }

  List<String?> _getVariablesFromPath({bool check = false}) {
    RegExp exp = RegExp(r'{(\w+)}');
    Iterable<RegExpMatch> matches = exp.allMatches(check ? _path! : path!);
    final foundVariables =
        matches.map((m) => m.group(1)).toList(growable: false);
    return foundVariables;
  }

  Map<String, dynamic> _filterRequestDataAndUpdatePath(
    List<String?> variables,
    Map<String, dynamic> requestData,
  ) {
    Map<String, dynamic> filteredRequestData = Map.from(requestData);
    variables.forEach((variable) {
      if (requestData.containsKey(variable)) {
        _path =
            path!.replaceAll('{$variable}', requestData[variable!].toString());
        filteredRequestData.remove(variable);
      }
    });

    return filteredRequestData;
  }

  @override
  Future<RestResponse> request(
      {RestMethod? method,
      String? path,
      Map<String, dynamic>? requestBody = const {}}) async {
    assert(method != null && path != null && path.isNotEmpty);

    this.path = path;
    _path = path;
    Map<String, dynamic>? requestJSON = requestBody;

    late Response response;
    Uri uri = Uri.parse(baseUrl + path);

    final variablesInPath = _getVariablesFromPath();
    if (variablesInPath.length > 0) {
      if (requestJSON == null) {
        // If a service has a variable in the path, request data is required
        Locator()
            .logger
            .debug('JsonService response missing request parameters');
        return RestResponse<String>(
          type: RestResponseType.badRequest,
          uri: uri,
          content: '',
        );
      }
      requestJSON =
          _filterRequestDataAndUpdatePath(variablesInPath, requestBody!);
      uri = Uri.parse(baseUrl + _path);
      if (_getVariablesFromPath(check: true).isNotEmpty) {
        // Some variables where not substituted by request fields
        Locator()
            .logger
            .debug('JsonService response invalid request parameters');
        return RestResponse<String>(
          type: RestResponseType.badRequest,
          uri: uri,
          content: '',
        );
      }
    }

    try {
      switch (method) {
        case RestMethod.get:
          response = await _ioClient.get(uri);
          break;
        case RestMethod.post:
          response = await _ioClient.post(uri, body: requestJSON);
          break;
        case RestMethod.put:
          response = await _ioClient.put(uri, body: requestJSON);
          break;
        case RestMethod.delete:
          response = await _ioClient.delete(uri);
          break;
        case RestMethod.patch:
          response = await _ioClient.patch(uri, body: requestJSON);
          break;
        case null:
          break;
      }

      print(response);

      return RestResponse<String>(
        type: getResponseTypeFromCode(response.statusCode),
        uri: uri,
        content: response.body,
      );
    } on ClientException {
      return RestResponse<String>(
        type: getResponseTypeFromCode(response.statusCode),
        uri: uri,
        content: response.body,
      );
    } catch (e) {
      return RestResponse<String>(
        type: RestResponseType.unknown,
        uri: uri,
        content: '',
      );
    }
  }

  @override
  Future<RestResponse> requestBinary({
    RestMethod? method,
    String? path,
    Map<String, dynamic> requestBody = const {},
  }) {
    // TODO: implement requestBinary
    throw UnimplementedError();
  }
}
