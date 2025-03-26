import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/src/core/constants/app_colors.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';

//TODO 7.a : change to loading widget
class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: Loading(
        size: 45.toH(),
      ),
    );
  }
}

class LoadingBox extends StatelessWidget {
  final Loading? loading;
  final Color? color;

  /// ratio of the screens height media query
  final double heightRatio;

  final double? width;

  final bool isFullScreen;
  final bool hasShadow;

  const LoadingBox({
    Key? key,
    this.loading,
    this.color,
    this.heightRatio = 1,
    this.width,
    this.isFullScreen = false,
    this.hasShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: isFullScreen
          ? MediaQuery.sizeOf(context).height
          : MediaQuery.sizeOf(context).height * heightRatio,
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      // width: MediaQuery.sizeOf(context)..width,
      // height: MediaQuery.sizeOf(context)..height,
      decoration: BoxDecoration(
        color: color,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ]
            : null,
      ),
      child: loading ?? const AppLoader(),
    );
  }
}

const Color _loadingColor = AppColors.primary;

/// Depends on loading_animation_widget  and flutter_spinkit Packages
class Loading extends StatelessWidget {
  final double size;
  final Color? color;
  final int durationSeconds;
  const Loading({
    Key? key,
    this.size = 20,
    this.color,
    this.durationSeconds = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color ?? _loadingColor,
      size: size,
      duration: Duration(seconds: durationSeconds),
    );
  }
}
