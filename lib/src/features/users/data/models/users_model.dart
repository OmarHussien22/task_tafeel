import 'package:task/src/features/users/domain/entities/users_entity.dart';

class UsersModel extends UsersEntity {
  const UsersModel({
    required super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.avatar,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      avatar: json['avatar'] ?? "",
    );
  }
}
