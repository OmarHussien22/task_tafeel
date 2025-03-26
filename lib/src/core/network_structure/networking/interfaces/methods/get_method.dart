abstract class GetMethod<R> {
  Future<R?> get({
    required Uri url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool auth = false,
  });
}
