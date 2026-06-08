class Source {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
    );
  }
}
class SourcesResponse {
  final String status;
  final List<Source> sources;

  SourcesResponse({
    required this.status,
    required this.sources,
  });

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] ?? '',
      sources: (json['sources'] as List<dynamic>? ?? [])
          .map((e) => Source.fromJson(e))
          .toList(),
    );
  }
}