import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'movie_card_item.dart';

class MoviesGrid extends StatefulWidget {
  final int childCount;
  final String movieCategory;
  final List<dynamic> movies;
  final ValueChanged<int> callback;

  const MoviesGrid({
    super.key,
    required this.childCount,
    required this.movieCategory,
    required this.movies,
    required this.callback,
  });

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      widget.callback(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView(
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, item, index) => MovieCardItem(
                itemIndex: index,
                itemCount: widget.childCount,
                movieCategory: widget.movieCategory,
                needsSpacing: false,
                movie: widget.movies[index],
              )),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2.6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3),
      pagingController: _pagingController,
    );
  }
}
