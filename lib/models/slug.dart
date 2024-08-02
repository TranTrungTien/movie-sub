class Slug {
  String id;
  String name;
  String slug;

  Slug({required this.id, required this.name, required this.slug});

  factory Slug.fromJson(Map<String, dynamic> json) {
    return Slug(
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