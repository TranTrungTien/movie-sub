import 'package:flutter/material.dart';
import 'package:mova/models/slug.dart';
import 'package:mova/https/home.dart';
import '../../../config/global/constants/app_static_data.dart';
import 'filter_title.dart';
import 'movie_filters.dart';

class ExploreModalItem extends StatefulWidget {
  final int index;

  ExploreModalItem({Key? key, required this.index}) : super(key: key);

  @override
  State<ExploreModalItem> createState() => _ExploreModalItemState();
}

class _ExploreModalItemState extends State<ExploreModalItem> {
  late Future<List<Slug>> future;
  @override
  void initState() {
    super.initState();
    switch (AppStaticData.explorers[widget.index]) {
      case 'Genres':
        future = ApiService.fetchGenres();
        break;
      case 'Countries':
        future = ApiService.fetchCountries();
        break;
      default:
        future = ApiService.fetchCategoies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterTitle(title: AppStaticData.explorers[widget.index]),
        FutureBuilder<List<Slug>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieFilters(
                  selectedIndex: 0,
                  slugs: snapshot.data!,
                );
              }
              return const SizedBox.shrink();
            }),
      ],
    );
  }
}
