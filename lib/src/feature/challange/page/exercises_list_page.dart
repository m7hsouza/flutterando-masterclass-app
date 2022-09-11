import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/widget/app_bar_custom.dart';

class ExercisesListPage extends StatelessWidget {
  const ExercisesListPage({
    Key? key,
    required this.title,
    required this.exercises,
  }) : super(key: key);

  final String title;
  final List<Map<String, String>> exercises;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            AppBarCustom(title: title),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (_, index) {
                    final exercise = exercises[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(exercise['route']!);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                              Text(exercise['title']!),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
