import 'package:flutter/material.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/features/users/presentation/widgets/crads/card_title.dart';
import 'package:task/src/shared/presentation/images/image_network.dart';

import '../../../../shared/presentation/text/custom_text.dart';

class UserDetailsPage extends StatelessWidget {
  final UsersEntity user;
  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const CustomText(
          'User Details',
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Hero(
              tag: "user_${user.id}",
              child: ImageNetwork(
                height: 300.toH(),
                url: user.avatar ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 8.toW(), vertical: 12.toH()),
              child: Column(
                children: [
                  CardTitle(
                    title: "First Name",
                    subTitle: user.firstName ?? "",
                  ),
                  10.ESH(),
                  CardTitle(
                    title: "Last Name",
                    subTitle: user.lastName ?? "",
                  ),
                  10.ESH(),
                  CardTitle(
                    title: "email",
                    subTitle: user.email ?? "",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
