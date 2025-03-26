import 'package:flutter/material.dart';
import 'package:task/src/core/constants/app_colors.dart';
import 'package:task/src/core/utils/extensions/screen_spaces_extension.dart';

class PaginationLoading extends StatelessWidget {
  final bool paginationLoading;

  const PaginationLoading({
    required this.paginationLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return paginationLoading
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.toH()),
              child: SizedBox(
                height: 40.toH(),
                width: 40.toW(),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
