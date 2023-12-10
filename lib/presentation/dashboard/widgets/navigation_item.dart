import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final SvgGenImage icon;
  final double iconHeight;
  final int topFlexSpacing;
  final int bottomFlexSpacing;
  final bool isSelected;
  final VoidCallback? onTap;
  const NavigationItem({
    super.key,
    required this.label,
    required this.icon,
    required this.iconHeight,
    required this.topFlexSpacing,
    required this.bottomFlexSpacing,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(flex: topFlexSpacing, child: const SizedBox.shrink()),
            icon.svg(
              height: iconHeight,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.white : AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            Expanded(flex: bottomFlexSpacing, child: const SizedBox.shrink()),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.b10Roboto(AppColors.white)
                  : AppTextStyles.r10Roboto(AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
