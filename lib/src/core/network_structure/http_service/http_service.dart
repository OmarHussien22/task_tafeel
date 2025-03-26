import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/http_service/methods/http_get.dart';
import 'package:task/src/core/network_structure/http_service/methods/http_post.dart';
import 'package:task/src/core/network_structure/networking/interfaces/networking.dart';
import 'package:task/src/core/network_structure/networking/utils/handel_http_response.dart';
import 'package:task/src/core/utils/general/print_dm.dart';

class HttpService extends Networking<http.Response, Exception> {
  HttpService._();

  static final instance = HttpService._();

  final HttpGet _get = HttpGet.instance;
  final HttpPost _post = HttpPost.instance;
  late http.Client _httpClient;

  @override
  void init({http.Client? client}) {
    _httpClient = client ?? http.Client();
    _get.injectHttp(_httpClient);
    _post.injectHttp(_httpClient);
    printDM(" HttpService Initialized with HttpClient");
  }

  @override
  Future<http.Response?> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
  }) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      final response =
          await _get.get(url: uri, headers: headers, queryParams: queryParams);
      if (response == null) {
        throw Exception("GET request returned null response");
      }
      return HandelHttpResponse.instance.handleResponse(response);
    } catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  @override
  Future<http.Response?> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
  }) async {
    try {
      final response = await _post.post(
        url: Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response == null) {
        throw Exception("POST request returned null response");
      }
      return HandelHttpResponse.instance.handleResponse(response);
    } catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  @override
  http.Response? handleResponse({http.Response? response, Exception? error}) {
    if (response == null) throw Exception("Response is null");
    return HandelHttpResponse.instance.handleResponse(response);
  }
}
