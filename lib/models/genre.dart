class Genre {
  final int id;
  final String name;
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> map) {
    return Genre(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }
}
