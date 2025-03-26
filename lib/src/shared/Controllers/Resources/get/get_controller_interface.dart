import 'package:get/get.dart';
import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';

import '../../Interface/master_controller.dart';

abstract class GetControllerInterface<T> extends GetxController
    with MasterController<T> {
  @override
  void emit(DataState<T> value) {
    state = value;
    update();
  }
}
