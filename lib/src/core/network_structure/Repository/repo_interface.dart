import 'dart:convert';
import 'dart:io';

import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';
import 'package:task/src/core/network_structure/Resources/Errors/error_model.dart';
import 'package:task/src/core/network_structure/networking/interfaces/service_interface.dart';
import 'package:task/src/core/network_structure/params/params.dart';
import 'package:task/src/core/utils/general/print_dm.dart';
import 'package:task/src/shared/entitis/pagination.dart';
import 'package:task/src/shared/models/pagination_model.dart';

enum ResponseType {
  withData,
  withoutData,
}

abstract class RepoInterface<T> {
  /// return Your [Service] Class Instance In This Getter
  ServicesInterface get serviceInstance;

  ResponseType get responseType => ResponseType.withData;

  T Function(dynamic data) get onParse;
  bool get hasPagination => false;

  Future<DataState<T>>? call({Params? params}) async {
    try {
      final httpResponse = await serviceInstance.applyService(params: params);
      if (httpResponse == null) {
        return DataFailed(
          ErrorModel(
            title: "Response is null",
            type: ErrorType.serverSide,
          ),
        );
      }

      final Map<String, dynamic> responseData = jsonDecode(httpResponse.body);

      final checkResponse = (httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted);

      if (checkResponse) {
        if (responseType == ResponseType.withoutData) {
          return DataSuccess<T>(onParse(responseData),
              message: responseData['message']);
        }

        if (responseData.containsKey('data')) {
          try {
            Pagination? pagination;
            if (hasPagination) {
              try {
                printDM("has Pagination => $responseData");
                pagination = PaginationModel.fromJson(responseData);
                printDM("Pagination data => $pagination");
              } catch (e) {
                printDM("Pagination Error => $e");
              }
            }
            if (responseData['data'] is List &&
                (responseData['data'] as List).isEmpty) {
              return DataFailed(
                ErrorModel(
                  title: "No Data Available",
                  type: ErrorType.dataEmpty,
                ),
              );
            }

            T data = onParse(responseData['data']);
            return DataSuccess<T>(data,
                message: responseData['message'], pagination: pagination);
          } catch (e) {
            printDM('on Catch error from Repo =>  $e');
            return DataFailed(
              ErrorModel(
                title: responseData['message'] ?? '',
                type: ErrorType.dirtyData,
              ),
            );
          }
        }
      }

      if (responseData.isNotEmpty) {
        printDM('Server Error: $responseData');
        return DataFailed(ErrorModel(
          title: responseData['message'] ?? 'error',
          type: ErrorType.serverSide,
        ));
      } else {
        return DataFailed(ErrorModel(
          title: 'An Error Occurred',
          type: ErrorType.serverSide,
        ));
      }
    } catch (e) {
      printDM('JSON Parsing Error: $e');
      return DataFailed(
        ErrorModel(
          title: 'Invalid JSON Response',
          type: ErrorType.unKnown,
        ),
      );
    }
  }
}
