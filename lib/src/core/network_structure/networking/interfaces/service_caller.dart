import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/params/params.dart';

abstract class ServiceCaller {
  Future<http.Response?> applyService({Params? params});
}
