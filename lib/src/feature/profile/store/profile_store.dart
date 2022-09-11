import 'package:masterclass_app/src/feature/profile/model/user_model.dart';
import 'package:masterclass_app/src/feature/profile/value_object/skill.dart';
import 'package:masterclass_app/src/feature/profile/value_object/technologie.dart';

class ProfileStore {
  final user = UserModel(
    imageUrl: 'https://avatars.githubusercontent.com/u/89148184?v=4',
    name: 'Matheus Lucas M Souza',
    bio: 'Duis rhoncus dui venenatis consequat porttitor. Etiam aliquet congue consequat. In posuere, nunc sit amet laoreet blandit, urna sapien.',
    technologies: [
      Technologie(name: 'Flutter', iconUrl: 'https://img.icons8.com/material-outlined/452/flutter.png'),
      Technologie(name: 'Dart', iconUrl: 'https://camo.githubusercontent.com/d2ec68b89f78e9969cc41fae76b4cc713d8fd7a07ee6ba8b6cf8fa8e172cf349/687474703a2f2f692e696d6775722e636f6d2f68746a5264426b2e706e67'),
      Technologie(name: 'Nodejs', iconUrl: 'https://img.icons8.com/windows/344/nodejs.png'),
      Technologie(name: 'Typescript', iconUrl: 'https://img.icons8.com/windows/344/typescript.png'),
    ],
    skills: [
      Skill(name: 'Dart/Flutter', grade: 8),
      Skill(name: 'Nodejs/Typescript', grade: 6),
      Skill(name: 'Git', grade: 5),
      Skill(name: 'Docker', grade: 5),
      Skill(name: 'PostgreSQL', grade: 7),
    ],
  );
}
