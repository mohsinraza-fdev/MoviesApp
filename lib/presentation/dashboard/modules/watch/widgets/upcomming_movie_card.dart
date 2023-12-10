import 'package:flutter/material.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/endpoints.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class UpcommingMovieCard extends StatelessWidget {
  final Movie movie;
  final TextStyle? titleFontSize;
  final Function(Movie)? onTap;
  const UpcommingMovieCard({
    super.key,
    required this.movie,
    this.titleFontSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335 / 180,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(movie);
          }
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(10),
            image: movie.backdropPath != null
                ? DecorationImage(
                    image: NetworkImage(
                      '${Endpoints.storageBaseUrl}${movie.backdropPath}',
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 70 / 180,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0), Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      movie.title,
                      style: titleFontSize ??
                          AppTextStyles.m18Poppins(AppColors.white),
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
