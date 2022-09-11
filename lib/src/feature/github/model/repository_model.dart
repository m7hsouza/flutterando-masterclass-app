class RepositoryModel {
  RepositoryModel({
    required this.name,
    this.description,
    this.language,
    required this.url,
    required this.stars,
    required this.forks,
    required this.updatedAt,
  });

  final String name;
  final String? description;
  final String url;
  final String? language;
  final int stars;
  final int forks;
  final DateTime updatedAt;
}
