import 'package:mova/models/slug.dart';

class MovieHome {
  String modified;
  String id;
  String name;
  String slug;
  String originName;
  String type;
  String thumbUrl;
  bool subDocquyen;
  String time;
  String episodeCurrent;
  String quality;
  String lang;
  int year;
  List<Slug> category;
  List<Slug> country;

  MovieHome({
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.type,
    required this.thumbUrl,
    required this.subDocquyen,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });

  factory MovieHome.fromJson(Map<String, dynamic> json) {
    return MovieHome(
      modified: json['modified']['time'],
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      type: json['type'],
      thumbUrl: json['thumb_url'],
      subDocquyen: json['sub_docquyen'],
      time: json['time'],
      episodeCurrent: json['episode_current'],
      quality: json['quality'],
      lang: json['lang'],
      year: json['year'],
      category: List<Slug>.from(json['category'].map((cat) => Slug.fromJson(cat))),
      country: List<Slug>.from(json['country'].map((c) => Slug.fromJson(c))),
    );
  }

  @override
  String toString() {
    return 'Item(modified: $modified, id: $id, name: $name, slug: $slug, originName: $originName, type: $type, thumbUrl: $thumbUrl, subDocquyen: $subDocquyen, time: $time, episodeCurrent: $episodeCurrent, quality: $quality, lang: $lang, year: $year, category: $category, country: $country)';
  }
}
