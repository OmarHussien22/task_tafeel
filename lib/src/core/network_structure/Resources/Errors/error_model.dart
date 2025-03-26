import 'package:get/get_utils/get_utils.dart';

class ErrorModel {
  String title;
  final ErrorType type;

  ErrorModel({
    required this.title,
    required this.type,
  }) {
    title = title.tr;
  }
}

enum ErrorType {
  serverSide,
  networkConnection,
  dataEmpty,
  dirtyData,
  unKnown,
  timeOut,
}

// error model
