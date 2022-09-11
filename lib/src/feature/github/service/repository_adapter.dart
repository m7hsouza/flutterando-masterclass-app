import 'package:masterclass_app/src/feature/github/model/repository_model.dart';

abstract class RepositoryAdapter {
  static List<RepositoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }

  static RepositoryModel fromJson(dynamic json) {
    return RepositoryModel(
      name: json['name'],
      description: json['description'],
      url: json['html_url'],
      language: json['language'],
      stars: json['stargazers_count'],
      forks: json['forks'],
      updatedAt: DateTime.parse(json['pushed_at']),
    );
  }
}
