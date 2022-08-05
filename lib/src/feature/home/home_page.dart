import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/widget/app_bar_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const AppBarCustom(
            title: 'Atividades',
          ),
        ],
      ),
    );
  }
}
