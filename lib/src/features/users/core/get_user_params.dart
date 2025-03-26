import 'package:task/src/core/network_structure/params/params.dart';

class GetUserParams extends Params {
  final int userId;

  GetUserParams({
    required this.userId,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': userId.toString(),
    };
  }
}
