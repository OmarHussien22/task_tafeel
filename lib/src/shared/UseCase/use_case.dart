import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';

abstract class UseCase<T, P> {
  Future<DataState<T>>? call({P? params});
}
