import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mova/config/global/constants/app_static_data.dart';
import 'package:mova/models/movie_home.dart';
import 'package:mova/models/newest_movie.dart';
import 'package:mova/models/slug.dart';

class ApiService {
  static Future<List<MovieHome>> fetchRecommenedHomeMovies() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response = await http.get(Uri.parse("$url/v1/api/home"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => MovieHome.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<List<MovieHome>> fetchSeriesMovies() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response = await http.get(Uri.parse("$url/v1/api/danh-sach/phim-bo"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => MovieHome.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<List<MovieHome>> fetchCartoonMovies() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response =
        await http.get(Uri.parse("$url/v1/api/danh-sach/hoat-hinh"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => MovieHome.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<List<Slug>> fetchGenres() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response = await http.get(Uri.parse("$url/v1/api/the-loai"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => Slug.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<List<Slug>> fetchCountries() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response = await http.get(Uri.parse("$url/v1/api/quoc-gia"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => Slug.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  static Future<List<Slug>> fetchCategoies() async {
    return Future(() {
      final List<Slug> categories = [];
      try {
        AppStaticData.categories.forEach((key, data) {
          categories.add(Slug(name: data["name"], slug: data["url"]));
        });
      } catch (e) {
        throw Exception('Failed to load items');
      }
      return categories;
    });
  }

  static Future<List<NewestMovie>> fetchNewestMovies() async {
    const url = AppStaticData.API_URL; // Replace with your API endpoint
    final response =
        await http.get(Uri.parse("$url/danh-sach/phim-moi-cap-nhat"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['items'];
      return itemsJson.map((json) => NewestMovie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
