import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final int id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UsersEntity({
    required this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];

  @override
  bool get stringify => true;
}
