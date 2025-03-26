import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';
import 'package:task/src/features/users/core/all_users_params.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/domain/repositories/fetch_all_users_repo.dart';
import 'package:task/src/shared/UseCase/use_case.dart';

class FetchAllUsersUseCase extends UseCase<List<UsersEntity>, AllUsersParams> {
  @override
  Future<DataState<List<UsersEntity>>>? call({AllUsersParams? params}) {
    return FetchAllUsersRepo.instance.call(
      params: params,
    );
  }
}
