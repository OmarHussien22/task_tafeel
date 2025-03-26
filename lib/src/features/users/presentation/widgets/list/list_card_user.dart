import 'package:flutter/material.dart';
import 'package:task/src/core/utils/general/print_dm.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/presentation/widgets/crads/card_user.dart';

class ListCardUser extends StatelessWidget {
  final List<UsersEntity> users;
  final ScrollController? scrollController;
  final Function(int) onTap;
  const ListCardUser(
      {super.key,
      required this.users,
      this.scrollController,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      controller: scrollController,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return CardUser(
          onTap: () {
            onTap(users[index].id);
            printDM("user id: ${users[index].id}");
          },
          user: users[index],
        );
      },
    );
  }
}
