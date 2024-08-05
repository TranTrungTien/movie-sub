import 'package:flutter/material.dart';
import 'package:mova/models/slug.dart';

class MovieFilters extends StatefulWidget {
  final int? selectedIndex;
  final List<Slug> slugs;

  const MovieFilters({
    super.key,
    this.selectedIndex,
    required this.slugs,
  });

  @override
  State<MovieFilters> createState() => _MovieFiltersState();
}

class _MovieFiltersState extends State<MovieFilters> {
  handleArray(List<Slug> data) {
    final List<Widget> slugs = [];
    for (var i = 0; i < data.length; i++) {
      slugs.add(ChoiceChip(
          label: Text(data[i].name), selected: false, onSelected: null));
    }
    return slugs;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: handleArray(widget.slugs),
    );
  }
}
