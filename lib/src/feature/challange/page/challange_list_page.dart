import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/widget/app_bar_custom.dart';
import 'package:masterclass_app/src/feature/challange/model/challange_model.dart';

import '../widget/challage_card.dart';

class ChallangeListPage extends StatelessWidget {
  ChallangeListPage({Key? key}) : super(key: key);

  final _challanges = <ChallangeModel>[
    ChallangeModel(
      title: 'Animações',
      icon: 'assets/icons/awesome-running.png',
      description: 'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos',
      url: 'http://',
      exercises: [
        {'title': 'Animação Implicita', 'route': '/challage/animaiton/implicit'},
        {'title': 'Animação Explicita', 'route': '/challage/animaiton/explicit'},
      ],
    ),
    ChallangeModel(
      title: 'Leitura de Mockup',
      icon: 'assets/icons/awesome-glasses.png',
      description: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
      url: 'http://',
      exercises: [
        {'title': 'Tela de login Tinder', 'route': '/challage/mockup/tinder'},
        {'title': 'Tela de login AppMoney', 'route': '/challage/mockup/smart-money'},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppBarCustom(
              title: 'Atividades',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _challanges.length,
                itemBuilder: (_, index) => ChallangeCard(_challanges[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
