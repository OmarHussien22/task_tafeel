import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/networking/interfaces/service_interface.dart';

import '../../../../core/network_structure/params/params.dart';

class FetchUserDetailsApiService extends ServicesInterface {
  FetchUserDetailsApiService._();

  static final instance = FetchUserDetailsApiService._();

  @override
  Future<http.Response?> applyService({Params? params}) {
    return super.call(
      uRLUserDetails,
      type: CrudType.get,
      auth: true,
      params: params,
    );
  }
}
