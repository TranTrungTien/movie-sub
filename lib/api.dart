import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Define the Item class with toString method
class Item {
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
  List<Category> category;
  List<Country> country;

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
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
      category: List<Category>.from(json['category'].map((cat) => Category.fromJson(cat))),
      country: List<Country>.from(json['country'].map((c) => Country.fromJson(c))),
    );
  }

  @override
  String toString() {
    return 'Item(modified: $modified, id: $id, name: $name, slug: $slug, originName: $originName, type: $type, thumbUrl: $thumbUrl, subDocquyen: $subDocquyen, time: $time, episodeCurrent: $episodeCurrent, quality: $quality, lang: $lang, year: $year, category: $category, country: $country)';
  }
}

class Category {
  String id;
  String name;
  String slug;

  Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug)';
  }
}

class Country {
  String id;
  String name;
  String slug;

  Country({required this.id, required this.name, required this.slug});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  @override
  String toString() {
    return 'Country(id: $id, name: $name, slug: $slug)';
  }
}

// ApiService to fetch data and parse the items list
class ApiService {
  static Future<List<Item>> fetchItems() async {
    final url = 'https://your-api-url.com'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> itemsJson = jsonResponse['data']['items'];
      return itemsJson.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}

// Main application entry point
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late Future<List<Item>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = ApiService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
      ),
      body: FutureBuilder<List<Item>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.type),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(item: item),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No items found'));
          }
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('ID: ${item.id}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Name: ${item.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Slug: ${item.slug}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Origin Name: ${item.originName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Type: ${item.type}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Thumb URL: ${item.thumbUrl}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Sub Docquyen: ${item.subDocquyen}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Time: ${item.time}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Episode Current: ${item.episodeCurrent}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Quality: ${item.quality}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Lang: ${item.lang}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Year: ${item.year}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Categories:', style: TextStyle(fontSize: 18)),
            ...item.category.map((cat) => Text('${cat.name}', style: TextStyle(fontSize: 18))),
            SizedBox(height: 8),
            Text('Countries:', style: TextStyle(fontSize: 18)),
            ...item.country.map((c) => Text('${c.name}', style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
