import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? horizontalMargin;
  final VoidCallback? onTap;
  const PrimaryButton({
    super.key,
    required this.label,
    this.width,
    this.horizontalMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: AppTextStyles.s14Poppins(AppColors.white),
        ),
      ),
    );
  }
}
