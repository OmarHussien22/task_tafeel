import 'package:task/src/core/network_structure/Repository/repo_interface.dart';
import 'package:task/src/core/network_structure/networking/interfaces/service_interface.dart';
import 'package:task/src/features/users/data/data_sources/fetch_all_users_api_service.dart';
import 'package:task/src/features/users/data/models/users_model.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';

class FetchAllUsersRepo extends RepoInterface<List<UsersEntity>> {
  FetchAllUsersRepo._();

  static final instance = FetchAllUsersRepo._();

  @override
  ServicesInterface get serviceInstance => FetchAllUsersApiService.instance;
  @override
  bool get hasPagination => true;

  @override
  List<UsersEntity> Function(dynamic data) get onParse => (data) {
        return data
            .map<UsersEntity>((item) => UsersModel.fromJson(item))
            .toList();
      };
}
