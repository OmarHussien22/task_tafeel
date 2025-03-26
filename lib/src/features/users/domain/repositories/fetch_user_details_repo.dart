import 'package:task/src/core/network_structure/Repository/repo_interface.dart';
import 'package:task/src/core/network_structure/networking/interfaces/service_interface.dart';
import 'package:task/src/features/users/data/data_sources/fetch_user_details_api_service.dart';
import 'package:task/src/features/users/data/models/users_model.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';

class FetchUserDetailsRepo extends RepoInterface<UsersEntity> {
  FetchUserDetailsRepo._();

  static final instance = FetchUserDetailsRepo._();

  @override
  ServicesInterface get serviceInstance => FetchUserDetailsApiService.instance;

  @override
  UsersEntity Function(dynamic data) get onParse => (data) {
        return UsersModel.fromJson(data);
      };
}
