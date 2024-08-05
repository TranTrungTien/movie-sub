import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class MovieCardItem extends StatelessWidget {
  final int itemIndex;
  final int itemCount;
  final String movieCategory;
  final bool needsSpacing;
  final dynamic? movie;

  const MovieCardItem({
    Key? key,
    required this.itemIndex,
    required this.itemCount,
    required this.movieCategory,
    required this.needsSpacing,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final margin = needsSpacing
        ? EdgeInsets.only(
            left: itemIndex == 0 ? 6.w : 10.w,
            right: itemIndex == itemCount - 1 ? 6.w : 0)
        : null;

    return SizedBox(
      width: 150.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: margin,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.ophim.live/uploads/movies/${movie?.thumbUrl ?? ""}"),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    movie?.quality ?? movie?.year.toString(),
                    style: theme.textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(movie?.name ?? "",
                  style: theme.textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1))
        ],
      ),
    );
  }
}
