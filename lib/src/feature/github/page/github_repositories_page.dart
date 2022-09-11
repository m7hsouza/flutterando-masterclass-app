import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/page/custom_page.dart';

class GithubRepositoriesPage extends StatelessWidget implements CustomPage {
  const GithubRepositoriesPage({Key? key}) : super(key: key);

  @override
  String get title => 'Repositórios';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
    );
  }
}
