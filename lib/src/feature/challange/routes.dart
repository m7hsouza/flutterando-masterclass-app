import 'package:flutter/cupertino.dart';

import 'package:animation/animation.dart';
import 'package:mockup/mockup.dart';

import 'package:masterclass_app/src/feature/challange/page/exercises_list_page.dart';

final challangeRoutes = <String, WidgetBuilder>{
  '/challage': (context) {
    final arguments = ModalRoute.of(context)!.settings.arguments! as Map;

    return ExercisesListPage(
      title: arguments['title']!,
      exercises: arguments['exercises']!,
    );
  },
  '/challage/animaiton/implicit': (_) => const ImplicitPage(),
  '/challage/animaiton/explicit': (_) => const ExplicitPage(),
  '/challage/mockup/tinder': (_) => const TinderLoginPage(),
  '/challage/mockup/smart-money': (_) => AppMoneyLoginPage(),
};
