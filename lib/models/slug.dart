class Slug {
  String name;
  String slug;

  Slug({required this.name, required this.slug});

  factory Slug.fromJson(Map<String, dynamic> json) {
    return Slug(
      name: json['name'],
      slug: json['slug'],
    );
  }

  @override
  String toString() {
    return 'Category(name: $name, slug: $slug)';
  }
}
