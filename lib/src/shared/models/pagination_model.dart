import 'package:task/src/shared/entitis/pagination.dart';

class PaginationModel extends Pagination {
  PaginationModel({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
  }) : super(
          page: page,
          perPage: perPage,
          total: total,
          totalPages: totalPages,
        );

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      page: json['page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
    };
  }
}
