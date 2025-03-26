import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/networking/interfaces/service_interface.dart';

import '../../../../core/network_structure/params/params.dart';

class FetchAllUsersApiService extends ServicesInterface {
  FetchAllUsersApiService._();

  static final instance = FetchAllUsersApiService._();

  @override
  Future<http.Response?> applyService({Params? params}) {
    return super.call(
      uRLGetUser,
      type: CrudType.get,
      auth: true,
      params: params,
    );
  }
}
