import 'package:flutter/cupertino.dart';
import 'package:task/src/shared/Controllers/Resources/get/get_controller_interface.dart';

abstract class PaginationController<T> extends GetControllerInterface<T> {
  bool paginationLoading = false;

  late ScrollController scrollController;

  int get fetchCurrentPage {
    if (state.pagination != null) {
      return state.pagination!.page! + 1;
    } else {
      return 1;
    }
  }

  Future<void> setFetchPaginationFunction();

  bool get canLoading {
    if (state.pagination != null) {
      return false;
    } else {
      return true;
    }
  }

  void scrollListen() {
    scrollController.addListener(
      () async {
        var nextPage = 0.8 * scrollController.position.maxScrollExtent;
        if (scrollController.position.pixels > nextPage) {
          if (!paginationLoading) {
            if (state.pagination != null) {
              if (state.pagination!.totalPages! > state.pagination!.page!) {
                paginationLoading = true;
                update();
                await setFetchPaginationFunction();
                paginationLoading = false;
                update();
              }
            }
          }
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollListen();
  }
}
