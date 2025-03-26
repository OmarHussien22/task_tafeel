import 'package:flutter/material.dart';
import 'package:task/src/core/constants/app_colors.dart';
import 'package:task/src/features/users/domain/entities/users_entity.dart';
import 'package:task/src/shared/presentation/images/image_network.dart';
import 'package:task/src/shared/presentation/text/custom_text.dart';

class CardUser extends StatelessWidget {
  final Function() onTap;
  final UsersEntity user;

  const CardUser({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        leading: Hero(
          tag: "user_${user.id}",
          child: ImageNetwork(
            url: user.avatar ?? "",
            radius: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: CustomText(
          "${user.firstName ?? ""} ${user.lastName ?? ""}",
        ),
        subtitle: CustomText(
          user.email ?? "",
          color: AppColors.primary,
          fontSize: 14,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
