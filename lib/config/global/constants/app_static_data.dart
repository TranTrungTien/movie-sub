import 'image_routes.dart';

class AppStaticData {
  static const API_URL = "https://ophim1.com";
  static const IMG_URL = "https://img.ophim.live/uploads/movies/";

  static const List profileOptionsData = [
    ['Edit Profile', AppImagesRoute.iconProfile],
    ['Notification', AppImagesRoute.iconBell],
    ['Download', AppImagesRoute.iconDownload],
    ['Security', AppImagesRoute.iconSecurity],
    ['Language', AppImagesRoute.iconLanguage],
    ['Dark Mode', AppImagesRoute.iconEye],
    ['Help Center', AppImagesRoute.iconHelp],
    ['Privacy policy', AppImagesRoute.iconPrivacy],
  ];

  static const List<String> downloadMoviesName = [
    'Lightyear',
    'Top Gun: Maverick',
    'Thor: Love & Thunder',
    'Stranger Things 4: Epi...',
    'Avatar: The Way of Wa...',
    'Doctor Strange in the ...',
  ];

  static const List<String> moviesFilter = [
    'Movie',
    'US',
    'Action',
    '2022',
    '2023',
    'Latest Release'
  ];

  static const List<String> explorers = ['Categories', 'Genres', 'Countries'];

  static const List<String> subscriptionCardFeaturesTitle = [
    'Watch all you want. Ad-free.',
    'Allows streaming of 4K.',
    'Video & Audio Quality is Better.'
  ];

  static const Map<String, dynamic> categories = {
    'series': {'name': "Phim bộ", 'url': "/v1/api/danh-sach/phim-bo"},
    'movie': {'name': "Phim lẻ", 'url': "/v1/api/danh-sach/phim-le"},
    'cartoon': {'name': "Hoạt hình", 'url': "/v1/api/danh-sach/hoat-hinh"},
    'tvShow': {'name': "Tv Shows", 'url': "/v1/api/danh-sach/tv-shows"},
    'vietsub': {
      'name': "Phim vietsub",
      'url': "/v1/api/danh-sach/phim-vietsub"
    },
    'narration': {
      'Phim thuyết minh': "Narration",
      'url': "/v1/api/danh-sach/phim-thuyet-minh"
    },
    'dubbing': {
      'name': "Phim lồng tiếng",
      'url': "/v1/api/danh-sach/phim-long-tieng"
    },
    'releasedSeries': {
      'name': "Phim bộ đang chiếu",
      'url': "/v1/api/danh-sach/phim-bo-dang-chieu"
    },
    'completedSeries': {
      'name': "Phim bộ hoàn thành",
      'url': "/v1/api/danh-sach/phim-bo-hoan-thanh"
    },
  };
}
