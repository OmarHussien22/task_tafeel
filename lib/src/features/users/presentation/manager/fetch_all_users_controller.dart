import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';
import 'package:task/src/core/utils/general/print_dm.dart';
import 'package:task/src/features/users/core/all_users_params.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/domain/use_cases/fetch_all_users_use_case.dart';
import 'package:task/src/shared/Controllers/Manager/pagination_controller.dart';

class FetchAllUsersController extends PaginationController<List<UsersEntity>> {
  @override
  Future<void> setFetchPaginationFunction() async {
    if (canLoading) {
      emit(const DataLoading());
    }
    FetchAllUsersUseCase useCase = FetchAllUsersUseCase();
    DataState<List<UsersEntity>> dataState = await useCase.call(
      params: AllUsersParams(
        page: fetchCurrentPage,
      ),
    )!;
    if (dataState is DataSuccess) {
      printDM("Omar Page $fetchCurrentPage");
      List<UsersEntity> oldUsers = state.data ?? [];
      oldUsers.addAll(dataState.data!);
      state = DataSuccess(
        oldUsers,
        pagination: dataState.pagination,
      );
    } else {
      // paginationLoading = true;
      // update();
      state = dataState;
      printDM("Omar2 Page $state");
    }
    emit(state);
    // update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setFetchPaginationFunction();
  }
}
