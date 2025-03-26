import 'package:flutter/material.dart';
import 'package:task/src/core/constants/app_colors.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';
import 'package:task/src/shared/presentation/text/custom_text.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CardTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "$title :",
          fontSize: 17,
        ),
        4.ESW(),
        Expanded(
          child: CustomText(
            subTitle,
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
