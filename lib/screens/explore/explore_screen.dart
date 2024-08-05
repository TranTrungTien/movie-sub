import 'package:flutter/material.dart';
import 'package:mova/https/home.dart';
import 'package:mova/models/movie_home.dart';
import 'package:mova/models/newest_movie.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/explore/widgets/movie_filters.dart';
import 'package:mova/screens/explore/widgets/search_and_filter.dart';
import 'package:provider/provider.dart';
import '../../config/global/widgets/movies_grid.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<NewestMovie>> movies;

  @override
  void initState() {
    super.initState();
    movies = ApiService.fetchNewestMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SearchAndFilter(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: FutureBuilder(
                  future: movies,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                          child:
                              Center(child: Text('Error: ${snapshot.error}')));
                    } else if (snapshot.hasData) {
                      return MoviesGrid(
                        childCount: snapshot.data.length,
                        movieCategory: 'new_movies',
                        movies: snapshot.data!,
                        callback: (value) {
                          print(value);
                        },
                      );
                    } else {
                      return const SliverToBoxAdapter(
                          child: Center(child: Text('No items found')));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
