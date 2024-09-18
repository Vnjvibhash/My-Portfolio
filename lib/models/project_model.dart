class Project {
  final String date;
  final List<String> images;
  final List<String> tech;
  final bool isLatest;
  final String name;
  final double rating;
  final String client;
  final String description;
  final int id;
  final String url;

  Project({
    required this.date,
    required this.images,
    required this.tech,
    required this.isLatest,
    required this.name,
    required this.rating,
    required this.client,
    required this.description,
    required this.id,
    required this.url,
  });

  // Factory method to create a Project from a map (Firebase snapshot data)
  factory Project.fromMap(Map<dynamic, dynamic> data) {
    return Project(
      date: data['date'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      tech: List<String>.from(data['tech'] ?? []),
      isLatest: data['isLatest'] ?? false,
      name: data['name'] ?? '',
      rating: data['rating']?.toDouble() ?? 0.0,
      client: data['client'] ?? '',
      description: data['description'] ?? '',
      id: data['_id'] ?? 0,
      url: data['url'] ?? '',
    );
  }
}
