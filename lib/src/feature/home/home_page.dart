import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/page/custom_page.dart';
import 'package:masterclass_app/src/common/widget/app_bar_custom.dart';

import 'package:masterclass_app/src/feature/challange/page/challange_list_page.dart';
import 'package:masterclass_app/src/feature/github/page/github_repositories_page.dart';
import 'package:masterclass_app/src/feature/home/home_store.dart';
import 'package:masterclass_app/src/feature/home/widget/navigation_bar_custom.dart';
import 'package:masterclass_app/src/feature/home/widget/navigation_bar_item_custom.dart';
import 'package:masterclass_app/src/feature/profile/page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore _store;

  @override
  void initState() {
    super.initState();

    _store = HomeStore();

    _store.addListener(() {
      setState(() {});
    });
  }

  final _pages = <Widget>[
    ChallangeListPage(),
    const GithubRepositoriesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final iconColor = IconTheme.of(context).color;

    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarCustom(title: (_pages[_store.currentPage] as CustomPage).title),
            const SizedBox(height: 16),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _pages[_store.currentPage],
            )),
            NavigationBarCustom(
              selectedIndex: _store.currentPage,
              onSelectedItem: _store.onSelectedItem,
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
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
