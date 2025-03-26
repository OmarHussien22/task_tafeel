import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/src/features/users/presentation/manager/fetch_all_users_controller.dart';
import 'package:task/src/features/users/presentation/manager/fetch_user_details_controller.dart';
import 'package:task/src/features/users/presentation/widgets/list/list_card_user.dart';
import 'package:task/src/shared/presentation/builders/data_status_builder.dart';

import '../../../../shared/presentation/loading/pagination_loading.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAllUsersController());
    FetchUserDetailsController cntUserDetails =
        Get.put(FetchUserDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: GetBuilder<FetchAllUsersController>(
        builder: (cnt) {
          return Column(
            children: [
              Expanded(
                child: DataStatusBuilder(
                  status: cnt.state,
                  onDoneBuild: cnt.state.data != null
                      ? ListCardUser(
                          onTap: cntUserDetails.setSelectedUserId,
                          users: cnt.state.data ?? [],
                          scrollController: cnt.scrollController,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              PaginationLoading(paginationLoading: cnt.paginationLoading),
            ],
          );
        },
      ),
    );
  }
}
