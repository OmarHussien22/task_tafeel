import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/networking/interfaces/methods/post_mehod.dart';
import 'package:task/src/core/network_structure/networking/utils/handel_http_exceptions.dart';
import 'package:task/src/core/network_structure/networking/utils/handel_http_response.dart';
import 'package:task/src/core/network_structure/networking/utils/header_handler.dart';
import 'package:task/src/core/utils/general/print_dm.dart';

class HttpPost extends PostMethod {
  HttpPost._();

  static final HttpPost instance = HttpPost._();

  http.Client _client = http.Client();

  injectHttp(http.Client value) {
    _client = value;
  }

  //<editor-fold desc="POST METHOD">
  @override
  Future<http.Response?> post({
    required Uri url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
  }) async {
    body ??= {};
    headers ??= HeaderHandler.instance.setHeaders(auth);

    try {
      final response = await _client.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      printDM(response.body);
      return HandelHttpResponse.instance.handleResponse(response);
    } catch (e) {
      printDM(e.toString());
      throw HandelHttpExceptions.instance.handleHttpError(e);
    }
  }
}
