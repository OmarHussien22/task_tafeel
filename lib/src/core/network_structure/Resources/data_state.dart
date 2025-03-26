import 'package:task/src/shared/entitis/pagination.dart';

enum ErrorType {
  serverSide,
  networkConnection,
  connectivity,
  dataEmpty,
  unKnown,
  message,
  dirtyData
}

class ErrorModel {
  ErrorType? errorType;
  String? errorTitle;

//<editor-fold desc="Data Methods">

  ErrorModel({
    this.errorType,
    this.errorTitle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorModel &&
          runtimeType == other.runtimeType &&
          errorType == other.errorType &&
          errorTitle == other.errorTitle);

  @override
  int get hashCode => errorType.hashCode ^ errorTitle.hashCode;

  @override
  String toString() {
    return 'ErrorModel{'
        ' errorType: $errorType,'
        ' errorTitle: $errorTitle,'
        '}';
  }

  ErrorModel copyWith({
    ErrorType? errorType,
    String? errorTitle,
  }) {
    return ErrorModel(
      errorType: errorType ?? this.errorType,
      errorTitle: errorTitle ?? this.errorTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'errorType': errorType,
      'errorTitle': errorTitle,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      errorType: map['errorType'] as ErrorType,
      errorTitle: map['errorTitle'] as String,
    );
  }

//</editor-fold>
}

abstract class DataState<T> {
  final T? data;
  final T? searchData;
  final Pagination? pagination;
  final ErrorModel? error;
  final String? message;

  const DataState({
    this.data,
    this.pagination,
    this.error,
    this.message,
    this.searchData,
  });

  @override
  String toString() {
    return 'DataState{data: $data, searchData: $searchData, pagination: $pagination, error: $error, message: $message}';
  }
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data,
      {String? message, T? searchData, Pagination? pagination})
      : super(
            data: data,
            message: message,
            pagination: pagination,
            searchData: searchData);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorModel error) : super(error: error);
}

class DataInitial<T> extends DataState<T> {
  const DataInitial() : super();
}

class DataLoading<T> extends DataState<T> {
  const DataLoading() : super();
}

class DataSearchLoading<T> extends DataState<T> {
  const DataSearchLoading() : super();
}
