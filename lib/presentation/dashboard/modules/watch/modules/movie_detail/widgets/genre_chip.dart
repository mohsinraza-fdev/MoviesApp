import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class GenreChip extends StatelessWidget {
  final String label;
  final Color chipColor;

  const GenreChip({
    super.key,
    required this.label,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: AppTextStyles.s12Poppins(AppColors.white),
      ),
    );
  }
}
