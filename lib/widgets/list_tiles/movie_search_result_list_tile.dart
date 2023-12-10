import 'package:flutter/material.dart';
import 'package:ten_twenty_test/models/genre_model.dart';
import 'package:ten_twenty_test/models/movie_model.dart';
import 'package:ten_twenty_test/network/endpoints.dart';
import 'package:ten_twenty_test/shared/assets_gen/assets.gen.dart';
import 'package:ten_twenty_test/shared/theme/app_colors.dart';
import 'package:ten_twenty_test/shared/theme/app_text_styles.dart';

class MovieSearchResultListTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final double horizontalMargin;
  const MovieSearchResultListTile({
    super.key,
    required this.movie,
    this.onTap,
    this.horizontalMargin = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 130,
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
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.m16Poppins(AppColors.text),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    Genre.fromJson({"id": movie.genreIds[0]}).toString(),
                    style: AppTextStyles.m12Poppins(const Color(0xFFDBDBDF)),
                  ),
                ],
              )),
              const SizedBox(width: 20),
              Assets.icons.meatBall.svg(
                width: 20,
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
