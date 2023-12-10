import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class AppSecondaryButton extends StatelessWidget {
  final String label;
  final double? width;
  final Widget? icon;
  final double? horizontalMargin;
  final VoidCallback? onTap;
  const AppSecondaryButton({
    super.key,
    required this.label,
    this.width,
    this.icon,
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
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.blue),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTextStyles.s14Poppins(AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
