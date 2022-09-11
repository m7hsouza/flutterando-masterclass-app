import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/page/custom_page.dart';

import 'package:masterclass_app/src/common/widget/app_bar_custom.dart';
import 'package:masterclass_app/src/feature/challange/utils/challanges.dart';

import '../widget/challage_card.dart';

class ChallangeListPage extends StatelessWidget implements CustomPage {
  ChallangeListPage({Key? key}) : super(key: key);

  final _challanges = challanges;

  @override
  String get title => 'Atividades';

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _challanges.length,
      itemBuilder: (_, index) => ChallangeCard(_challanges[index]),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
