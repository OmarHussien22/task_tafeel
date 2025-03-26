import 'package:http/http.dart' as http;
import 'package:task/src/core/network_structure/Constants/exception_constants.dart';
import 'package:task/src/core/network_structure/Exceptions/failure.dart';
import 'package:task/src/core/network_structure/api_names.dart';
import 'package:task/src/core/network_structure/http_service/methods/http_get.dart';
import 'package:task/src/core/network_structure/http_service/methods/http_post.dart';
import 'package:task/src/core/network_structure/networking/interfaces/service_caller.dart';
import 'package:task/src/core/network_structure/params/params.dart';

import '../../../utils/general/print_dm.dart';

enum CrudType {
  post,
  get,
}

void _printUrl(String value, {required String url}) {
  printDM(
    value,
    name: url.substring(
      ApiNames.baseUrl.length,
    ),
  );
}

abstract class ServicesInterface with ApiNames implements ServiceCaller {
  // final http.Client _client = http.Client();

  Future<http.Response?> call(
    String url, {
    bool auth = false,
    bool forceRefresh = false,
    bool showLoadingDialog = false,
    required CrudType type,
    Map<String, String>? headers,
    Params? params,
  }) async {
    http.Response? response;
    try {
      switch (type) {
        case CrudType.post:
          response = await HttpPost.instance.post(
            url: Uri.parse(url),
            body: params?.toJson() ?? {},
          );
          break;
        case CrudType.get:
          response = await HttpGet.instance.get(
            url: Uri.parse(url),
            queryParams: params?.toJson(),
          );
          break;
      }

      if (response!.statusCode >= 200 && response.statusCode < 300) {
        _printUrl('Success Response: ${response.body}', url: url);
        return response;
      } else {
        throw _handleHttpException(response.statusCode, url);
      }
    } catch (e) {
      printDM('Error: $e', name: 'ServicesInterface');
      throw UnKnownException(ExceptionConstants.instance.unKnownException);
    }
  }

  Exception _handleHttpException(int statusCode, String url) {
    switch (statusCode) {
      case 400:
        _printUrl('BadRequestException >> $statusCode', url: url);
        return BadRequestException(
            ExceptionConstants.instance.badRequestException);
      case 403:
        _printUrl('ForbiddenException >> $statusCode', url: url);
        return ForbiddenException(
            ExceptionConstants.instance.forbiddenException);
      case 401:
        _printUrl('UnAuthorizedException >> $statusCode', url: url);
        return UnAuthorizedException(
            ExceptionConstants.instance.unAuthorizedException);
      case 404:
        _printUrl('NotFoundException >> $statusCode', url: url);
        return NotFoundException(ExceptionConstants.instance.notFoundException);
      case 405:
        _printUrl('MethodNotAllowedException >> $statusCode', url: url);
        return MethodNotAllowedException(
            ExceptionConstants.instance.methodNotAllowedException);
      case 408:
        _printUrl('RequestTimeoutException >> $statusCode', url: url);
        return RequestTimeoutException(
            ExceptionConstants.instance.requestTimeoutException);
      case 409:
        _printUrl('ConflictException >> $statusCode', url: url);
        return ConflictException(ExceptionConstants.instance.conflictException);
      case 500:
        _printUrl('InternalServerException >> $statusCode', url: url);
        return InternalServerException(
            ExceptionConstants.instance.internalServerException);
      case 502:
        _printUrl('BadGatewayException >> $statusCode', url: url);
        return BadGatewayException(
            ExceptionConstants.instance.badGatewayException);
      case 503:
        _printUrl('ServiceUnavailableException >> $statusCode', url: url);
        return ServiceUnavailableException(
            ExceptionConstants.instance.serviceUnavailableException);
      case 504:
        _printUrl('GatewayTimeoutException >> $statusCode', url: url);
        return GatewayTimeoutException(
            ExceptionConstants.instance.gatewayTimeoutException);
      default:
        _printUrl('UnKnownException >> $statusCode', url: url);
        return UnKnownException(ExceptionConstants.instance.unKnownException);
    }
  }
}
