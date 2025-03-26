import 'package:task/src/core/network_structure/api_names.dart';

abstract class Networking<R, E> with ApiNames {
  final String _baseUrl = ApiNames.baseUrl;
  String get baseUrl => _baseUrl;

  void init();

  Future<R?> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
  });
  Future<R?> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
  });

  // handle
  R? handleResponse({R? response, E? error});
}
