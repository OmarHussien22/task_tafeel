import 'package:get/get.dart';
import 'package:task/src/core/utils/general/print_dm.dart';
import 'package:task/src/features/users/core/get_user_params.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/domain/use_cases/fetch_user_datails_use_case.dart';
import 'package:task/src/features/users/presentation/pages/user_details_page.dart';
import 'package:task/src/shared/Controllers/Resources/get/get_controller_interface.dart';

import '../../../../core/network_structure/Resources/DataState/data_state.dart';

class FetchUserDetailsController extends GetControllerInterface<UsersEntity> {
  int? selectedUserId;

  void setSelectedUserId(int? userId) {
    selectedUserId = userId;
    fetchUserDetails(userId: userId ?? 0);
    update();
  }

  fetchUserDetails({required int userId}) async {
    emit(const DataLoading());
    final FetchUserDetailsUseCase useCase = FetchUserDetailsUseCase();
    state = await useCase.call(
      params: GetUserParams(userId: userId),
    )!;
    emit(state);
    if (state is DataSuccess) {
      printDM("state success data fetch user details: ${state.data}");
      // To ensure that the data arrived
      Get.to(
        () => UserDetailsPage(user: state.data!),
        transition: Transition.fadeIn,
      );
    } else {
      printDM("state error fetch user details: ${state.error!.title}");
    }
  }
}
