import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/widget/custom_card.dart';
import 'package:masterclass_app/src/feature/profile/value_object/skill.dart';

import 'grade_widget.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key, required this.skills}) : super(key: key);

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Habilidades e Competências', style: textTheme.headline4),
          const SizedBox(height: 12),
          CustomCard(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: skills.map((skill) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            skill.name,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyText1,
                          ),
                        ),
                        GradeWidget(grade: skill.grade),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
