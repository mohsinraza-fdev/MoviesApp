import 'package:flutter/material.dart';
import 'package:ten_twenty_test/models/genre_model.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;
  final String image;
  final TextStyle? titleFontSize;
  final Function(Genre)? onTap;
  const GenreCard({
    super.key,
    required this.genre,
    required this.image,
    this.titleFontSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 163 / 100,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(genre);
          }
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Text(
                      genre.toString(),
                      style: titleFontSize ??
                          AppTextStyles.m16Poppins(AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
