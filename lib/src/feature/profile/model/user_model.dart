import 'package:masterclass_app/src/feature/profile/value_object/skill.dart';
import 'package:masterclass_app/src/feature/profile/value_object/technologie.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.imageUrl,
    required this.bio,
    this.technologies = const [],
    this.skills = const [],
  });

  final String name;
  final String imageUrl;
  final String bio;

  final List<Technologie> technologies;
  final List<Skill> skills;
}
