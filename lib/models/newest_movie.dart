class NewestMovie {
  Tmdb? tmdb;
  Imdb? imdb;
  Modified? modified;
  String? sId;
  String? name;
  String? slug;
  String? originName;
  String? thumbUrl;
  String? posterUrl;
  double? year;
  String? quality;

  NewestMovie(
      {this.tmdb,
      this.imdb,
      this.modified,
      this.sId,
      this.name,
      this.slug,
      this.originName,
      this.thumbUrl,
      this.posterUrl,
      this.quality,
      this.year});

  NewestMovie.fromJson(Map<String, dynamic> json) {
    tmdb = json['tmdb'] != null ? new Tmdb.fromJson(json['tmdb']) : null;
    imdb = json['imdb'] != null ? new Imdb.fromJson(json['imdb']) : null;
    modified = json['modified'] != null
        ? new Modified.fromJson(json['modified'])
        : null;
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    originName = json['origin_name'];
    thumbUrl = json['thumb_url'];
    posterUrl = json['poster_url'];
    year = json['year'];
    quality = json['quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tmdb != null) {
      data['tmdb'] = this.tmdb!.toJson();
    }
    if (this.imdb != null) {
      data['imdb'] = this.imdb!.toJson();
    }
    if (this.modified != null) {
      data['modified'] = this.modified!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['origin_name'] = this.originName;
    data['thumb_url'] = this.thumbUrl;
    data['poster_url'] = this.posterUrl;
    data['year'] = this.year;
    data['quality'] = this.quality;
    return data;
  }
}

class Tmdb {
  String? type;
  String? id;
  double? season;
  double? voteAverage;
  double? voteCount;

  Tmdb({this.type, this.id, this.season, this.voteAverage, this.voteCount});

  Tmdb.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    season = json['season'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['season'] = this.season;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Imdb {
  String? id;

  Imdb({this.id});

  Imdb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Modified {
  String? time;

  Modified({this.time});

  Modified.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    return data;
  }
}
