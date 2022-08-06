import 'package:flutter/material.dart';

import 'package:masterclass_app/src/feature/challange/page/challange_list_page.dart';
import 'package:masterclass_app/src/feature/home/widget/navigation_bar_custom.dart';
import 'package:masterclass_app/src/feature/home/widget/navigation_bar_item_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final _pages = <Widget>[
    ChallangeListPage(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  _onSelectedItem(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = IconTheme.of(context).color;

    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pages[_currentPage]),
            NavigationBarCustom(
              selectedIndex: _currentPage,
              onSelectedItem: _onSelectedItem,
              items: [
                NavigationBarItemCustom(
                  icon: Image.asset('assets/icons/feather-target.png', color: iconColor),
                  label: 'Atividades',
                ),
                NavigationBarItemCustom(
                  icon: Image.asset('assets/icons/awesome-github.png', color: iconColor),
                  label: 'Repositórios',
                ),
                const NavigationBarItemCustom(icon: Icon(Icons.person, size: 26), label: 'Sobre o dev'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
