import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/helpers/utils.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';

class PrimaryAppBar extends StatelessWidget {
  final double height;
  final Widget? child;
  const PrimaryAppBar({
    super.key,
    this.height = 64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: statusBarHeight(context) + height,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: statusBarHeight(context)),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.border,
          ),
        ),
      ),
      child: child,
    );
  }
}
