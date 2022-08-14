import 'package:flutter/material.dart';

import 'package:masterclass_app/src/feature/challange/model/challange_model.dart';

class ChallangeCard extends StatelessWidget {
  const ChallangeCard(this.challage, {Key? key}) : super(key: key);

  final ChallangeModel challage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        challage.icon,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(challage.title, style: textTheme.headline2),
                  const Spacer(),
                  Text('Exercicios: ', style: textTheme.caption),
                  Text('${challage.exercises.length}', style: textTheme.headline3),
                ],
              ),
              Text(
                challage.description,
                style: textTheme.caption,
                textAlign: TextAlign.justify,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/awesome-github.png',
                    color: IconTheme.of(context).color,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    child: Text('Acessar código fonte', style: textTheme.overline),
                  ),
                  const Spacer(),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('Ver mais', style: textTheme.button),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/challage',
                        arguments: {
                          'title': challage.title,
                          'exercises': challage.exercises,
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
