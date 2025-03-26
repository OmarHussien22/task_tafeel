abstract class PostMethod<R> {
  Future<R?> post({
    required Uri url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
  });
}
