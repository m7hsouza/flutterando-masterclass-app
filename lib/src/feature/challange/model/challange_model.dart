class ChallangeModel {
  final String title;
  final String icon;
  final String description;
  final String url;
  final List<Map<String, String>> exercises;

  ChallangeModel({
    required this.title,
    required this.icon,
    required this.description,
    required this.url,
    required this.exercises,
  });
}
