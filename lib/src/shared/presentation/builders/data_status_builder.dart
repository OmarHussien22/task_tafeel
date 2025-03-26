import 'package:flutter/material.dart';
import 'package:task/src/core/network_structure/Resources/DataState/data_state.dart';
import 'package:task/src/shared/presentation/loading/app_loader.dart';
import 'package:task/src/shared/presentation/text/custom_text.dart';

class DataStatusBuilder extends StatelessWidget {
  final DataState status;
  final Widget? initialBuild;
  final Widget onDoneBuild;
  final Widget? onConnectionErrorBuild;
  final Widget? onErrorBuild;
  final Widget? onLoadingBuild;
  final VoidCallback? onRedirect;
  final bool isOnRefreshed;
  const DataStatusBuilder({
    Key? key,
    required this.status,
    required this.onDoneBuild,
    this.onConnectionErrorBuild,
    this.initialBuild,
    this.onErrorBuild,
    this.onLoadingBuild,
    this.onRedirect,
    this.isOnRefreshed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget = const SizedBox.shrink();
    if (status is DataInitial) {
      widget = initialBuild ?? const SizedBox.shrink();
    } else if (status is DataLoading) {
      widget = onLoadingBuild ??
          (isOnRefreshed ? const SizedBox.shrink() : const AppLoader());
    } else if (status is DataSuccess) {
      widget = onDoneBuild;
    } else if (status is DataFailed) {
      widget = onErrorBuild ??
          CustomText(
            (status as DataFailed).error?.title ??
                "حدث خطأ أثناء تحميل البيانات",
            textAlign: TextAlign.center,
          );
    } else {
      widget = onLoadingBuild ??
          (isOnRefreshed ? const SizedBox.shrink() : const AppLoader());
      // widget = Center();
    }
    return widget;
  }
}
