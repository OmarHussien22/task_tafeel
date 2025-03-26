import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/networking/interfaces/methods/get_method.dart';
import 'package:task/src/core/network_structure/networking/utils/handel_http_exceptions.dart';
import 'package:task/src/core/network_structure/networking/utils/handel_http_response.dart';
import 'package:task/src/core/network_structure/networking/utils/header_handler.dart';
import 'package:task/src/core/utils/general/print_dm.dart';

class HttpGet extends GetMethod {
  HttpGet._();

  static final HttpGet instance = HttpGet._();

  http.Client _client = http.Client();

  injectHttp(http.Client value) {
    _client = value;
  }

  @override
  Future<http.Response?> get({
    required Uri url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
  }) async {
    http.Response? response;
    final uri = url.replace(queryParameters: queryParams);
    headers ??= HeaderHandler.instance.setHeaders(auth);
    try {
      response = await _client.get(
        uri,
        headers: headers,
      );
      printDM(response.body);
    } catch (e) {
      HandelHttpExceptions.instance.handleHttpError(e);
      return null;
    }

    return HandelHttpResponse.instance.handleResponse(response);
  }
}
