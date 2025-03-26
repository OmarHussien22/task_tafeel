import 'package:task/src/core/utils/general/print_dm.dart';

class HeaderHandler {
  HeaderHandler._();

  static HeaderHandler instance = HeaderHandler._();

  /// set header
  Map<String, String> setHeaders(bool isAuth) {
    String token = "";
    if (isAuth) {
      token = "";
      printDM("token => $token");
    }
    return {
      'Accept-Language': 'ar',
      if (isAuth && (token != "")) 'Authorization': 'Bearer $token'
    };
  }
}
