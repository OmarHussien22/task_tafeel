import 'package:task/src/core/network_structure/params/params.dart';

class AllUsersParams extends Params {
  final int? page;

  AllUsersParams({
    this.page,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page?.toString(),
    };
  }
}
