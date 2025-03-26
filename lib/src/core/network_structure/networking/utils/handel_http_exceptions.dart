import 'dart:io';

class HandelHttpExceptions {
  HandelHttpExceptions._();
  static final instance = HandelHttpExceptions._();

  Exception handleHttpError(dynamic e) {
    if (e is SocketException) {
      return Exception("No internet connection, please check your network.");
    } else if (e is HttpException) {
      return Exception("HTTP error occurred: ${e.message}");
    } else if (e is FormatException) {
      return Exception("Bad response format.");
    } else {
      return Exception("Unexpected error occurred: $e");
    }
  }
}
