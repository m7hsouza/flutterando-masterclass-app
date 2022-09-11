import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/page/custom_page.dart';
import 'package:masterclass_app/src/feature/profile/store/profile_store.dart';
import 'package:masterclass_app/src/feature/profile/widget/skills_widget.dart';
import 'package:masterclass_app/src/feature/profile/widget/technologies_widget.dart';
import 'package:masterclass_app/src/feature/profile/widget/user_details_widget.dart';

class ProfilePage extends StatelessWidget implements CustomPage {
  ProfilePage({Key? key}) : super(key: key);

  final store = ProfileStore();

  @override
  String get title => 'Sobre o dev';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserDetailsWidget(
            name: store.user.name,
            bio: store.user.bio,
            imageUrl: store.user.imageUrl,
          ),
          const SizedBox(height: 16),
          TechnologiesWidget(technologies: store.user.technologies),
          const SizedBox(height: 16),
          SkillsWidget(skills: store.user.skills)
        ],
      ),
    );
  }
}
