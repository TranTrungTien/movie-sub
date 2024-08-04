import 'package:flutter/material.dart';
import 'package:mova/config/global/widgets/movies_grid.dart';
import 'package:mova/https/home.dart';
import 'package:mova/models/movie_home.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/home/widgets/movie_list_title.dart';
import 'package:mova/screens/home/widgets/top_header.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieHome>> newestMovies;
  late Future<List<MovieHome>> seriesMovies;
  late Future<List<MovieHome>> cartoonMovies;

  @override
  void initState() {
    super.initState();
    // newestMovies = ApiService.fetchNewestMovies();
    // seriesMovies = ApiService.fetchSeriesMovies();
    // cartoonMovies = ApiService.fetchCartoonMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
          body: CustomScrollView(
        slivers: [
          // const TopHeader(),
          // const MovieListTitle(title: 'New Releases'),
          // MovieTypeGrid(moviesFuture: newestMovies),
          // const MovieListTitle(title: 'Series'),
          // MovieTypeGrid(moviesFuture: seriesMovies),
          // const MovieListTitle(title: 'Cartoon'),
          // MovieTypeGrid(moviesFuture: cartoonMovies),
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
        ],
      )),
    );
  }
}

class MovieTypeGrid extends StatelessWidget {
  const MovieTypeGrid({
    super.key,
    required this.moviesFuture,
  });

  final Future<List<MovieHome>> moviesFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieHome>>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
              child: Center(child: Text('Error: ${snapshot.error}')));
        } else if (snapshot.hasData) {
          final List<MovieHome> movies = snapshot.data!.sublist(0, 6);
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: MoviesGrid(
              childCount: movies.length,
              movieCategory: 'new_movies',
              movieHome: movies,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: Text('No items found')));
        }
      },
    );
  }
}
