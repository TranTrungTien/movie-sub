import 'package:flutter/material.dart';
import 'package:mova/models/movie_home.dart';

import '../../../config/global/widgets/movie_card_item.dart';

class MovieList extends StatelessWidget {
  final int itemCount;
  final String movieCategory;
  final List<MovieHome> movieHome;

  const MovieList({
    super.key,
    required this.itemCount,
    required this.movieCategory,
    required this.movieHome,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: movieHome.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MovieCardItem(
            itemIndex: index,
            itemCount: movieHome.length,
            movieCategory: movieCategory,
            needsSpacing: true,
            movieHome: movieHome[index],
          ),
        ),
      ),
    );
  }
}
