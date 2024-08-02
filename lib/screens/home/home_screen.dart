import 'package:flutter/material.dart';
import 'package:mova/https/home.dart';
import 'package:mova/models/movie_home.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/home/widgets/movie_list.dart';
import 'package:mova/screens/home/widgets/movie_list_title.dart';
import 'package:mova/screens/home/widgets/top_header.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieHome>> movies;

  @override
  void initState() {
    super.initState();
    movies = ApiService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        body:
        FutureBuilder<List<MovieHome>>(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return  CustomScrollView(
                slivers: [
                  const TopHeader(),
                  const MovieListTitle(title: 'Top 10 Movies This Week'),
                  MovieList(itemCount: 6, movieCategory: 'top_movies', movieHome: snapshot.data!,),
                  const MovieListTitle(title: 'New Releases'),
                  MovieList(itemCount: 6, movieCategory: 'new_movies', movieHome: snapshot.data!),
                  const SliverPadding(padding: EdgeInsets.only(top: 24)),
                ],
              );
            } else {
              return const Center(child: Text('No items found'));
            }
          },
        )
      ),
    );
  }
}
