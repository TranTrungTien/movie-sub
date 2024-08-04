import 'package:flutter/material.dart';
import 'package:mova/models/movie_home.dart';

import 'movie_card_item.dart';

class MoviesGrid extends StatelessWidget {
  final int childCount;
  final String movieCategory;
  final List<MovieHome> movieHome;

  const MoviesGrid({
    super.key,
    required this.childCount,
    required this.movieCategory,
    required this.movieHome,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: childCount,
        (context, index) => MovieCardItem(
          itemIndex: index,
          itemCount: childCount,
          movieCategory: movieCategory,
          needsSpacing: false,
          movieHome: movieHome[index],
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2.6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3),
    );
  }
}
