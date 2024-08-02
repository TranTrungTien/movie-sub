import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mova/config/global/constants/app_static_data.dart';
import 'package:mova/models/movie_home.dart';

class ApiService {
  static Future<List<MovieHome>> fetchItems() async {
    final url = AppStaticData.API_URL; // Replace with your API endpoint
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
}