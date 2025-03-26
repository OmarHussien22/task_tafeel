import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';
import 'package:task/src/core/utils/general/print_dm.dart';
import 'package:task/src/shared/presentation/loading/app_loader.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Color? backgroundColor;
  final String? onNetworkErrorImage;
  final bool previewImage;
  final double? previewImageMaxScale;
  final double? previewImageMinScale;
  final double scale;
  final EdgeInsets? padding;

  const ImageNetwork({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.alignment,
    this.color,
    this.backgroundColor,
    this.radius,
    this.borderRadius,
    this.onNetworkErrorImage,
    this.previewImage = false,
    this.previewImageMaxScale,
    this.previewImageMinScale,
    this.padding,
    this.scale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        height: (radius ?? height)?.toH(),
        width: (radius ?? width)?.toW(),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: radius != null ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          fadeInCurve: Curves.easeInBack,
          placeholder: (context, url) => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).height * 0.1,
            child: const AppLoader(),
          ),
          fit: fit,
          errorWidget: (context, url, error) {
            printDM(error.toString(), name: 'ImageNetwork');
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
