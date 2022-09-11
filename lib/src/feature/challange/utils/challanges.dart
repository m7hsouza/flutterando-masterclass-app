import 'package:masterclass_app/src/feature/challange/model/challange_model.dart';

final challanges = [
  ChallangeModel(
    title: 'Animações',
    icon: 'assets/icons/animation.png',
    description: 'Estudos sobre animações implícitas e controladas, contendo 4 exercícios e 2 estudos',
    url: 'https://github.com/m7hsouza/flutterando-masterclass-app/tree/main/package/animation',
    exercises: [
      {
        'title': 'Animação Implicita',
        'route': '/challage/animaiton/implicit'
      },
      {
        'title': 'Animação Explicita',
        'route': '/challage/animaiton/explicit'
      }
    ],
  ),
  ChallangeModel(
    title: 'Leitura de Mockup',
    icon: 'assets/icons/mockup.png',
    description: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios',
    url: 'https://github.com/m7hsouza/flutterando-masterclass-app/tree/main/package/mockup',
    exercises: [
      {
        'title': 'Tela de login Tinder',
        'route': '/challage/mockup/tinder'
      },
      {
        'title': 'Tela de login AppMoney',
        'route': '/challage/mockup/smart-money'
      }
    ],
  ),
  ChallangeModel(
    title: 'Design Patterns',
    icon: 'assets/icons/design-pattern.png',
    description: 'Conecher e saber como aplicar alguns dos princpais Design Patterns como: MVC, MVVM, Repository e etc.',
    url: 'https://github.com/m7hsouza/flutterando-masterclass-app/tree/main/package/design-pattern',
    exercises: [
      {
        'title': 'Gerador de CPF',
        'route': '/challage/design-pattern/document-generator'
      },
      {
        'title': 'Econtrar Enderço pelo CEP',
        'route': '/challage/design-pattern/address'
      },
      {
        'title': 'API do IBGE usando Repository',
        'route': '/challage/design-pattern/ibge'
      }
    ],
  ),
];
