import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';
import 'package:task/src/features/users/core/get_user_params.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/domain/repositories/fetch_user_details_repo.dart';
import 'package:task/src/shared/UseCase/use_case.dart';

class FetchUserDetailsUseCase extends UseCase<UsersEntity, GetUserParams> {
  @override
  Future<DataState<UsersEntity>>? call({GetUserParams? params}) {
    return FetchUserDetailsRepo.instance.call(
      params: params,
    );
  }
}
