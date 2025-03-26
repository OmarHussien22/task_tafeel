import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;

  Pagination({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
  });

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
      ];

  @override
  bool get stringify => true;
}
