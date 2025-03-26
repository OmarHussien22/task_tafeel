import 'package:flutter/material.dart';
import 'package:task/src/core/constants/app_colors.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final double? letterSpacing;
  final bool isBold;
  final bool textShadow;
  final bool isUpperCase;
  final EdgeInsetsGeometry? padding;
  final bool isOverFlow;
  final int? maxLines;
  final double? textHeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final FontWeight fontWeight;

  const CustomText(
    this.label, {
    Key? key,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.isBold = false,
    this.isOverFlow = false,
    this.isUpperCase = false,
    this.padding,
    this.maxLines,
    this.textHeight = 1.4,
    this.fontFamily,
    this.textAlign,
    this.textShadow = false,
    this.backgroundColor,
    this.letterSpacing,
  }) : super(key: key);

//</editor-fold>
  //<editor-fold desc="Subtitle Text">
  /// fWs
  factory CustomText.subtitle(
    String label, {
    Key? key,
    Color? color,
    Color? backgroundColor,
    bool isUpperCase = false,
    bool isBold = false,
    double fontSize = 14.0,
    int? maxLines,
    bool isOverFlow = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    TextAlign? textAlign,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      CustomText(
        label,
        key: key,
        isUpperCase: isUpperCase,
        backgroundColor: backgroundColor,
        color: color ?? AppColors.primaryText,
        fontSize: fontSize,
        fontWeight: fontWeight,
        isOverFlow: isOverFlow,
        isBold: isBold,
        padding: padding,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              backgroundColor: backgroundColor,
              fontSize: (fontSize ?? 16).toFS(),
              fontWeight: fontWeight,
              height: textHeight,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily,
              shadows: textShadow
                  ? [
                      Shadow(
                        blurRadius: 0.8.toRad(),
                        color: Colors.black,
                        offset: const Offset(1, 1),
                      )
                    ]
                  : null,
            ),
        textAlign: textAlign,
        overflow: isOverFlow ? TextOverflow.ellipsis : null,
        maxLines: maxLines,
      ),
    );
  }
}
