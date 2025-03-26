import 'package:http/http.dart' as http;

class HandelHttpResponse {
  HandelHttpResponse._();
  static final instance = HandelHttpResponse._();

  http.Response handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception(
          "Error: ${response.statusCode}, Message: ${response.body}");
    }
  }
}
