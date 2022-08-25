import 'package:flutter/material.dart';

import 'package:design_pattern/src/ibge/model/uf_model.dart';

class ListUfsPage extends StatelessWidget {
  const ListUfsPage(this.ufs, {Key? key}) : super(key: key);
  final List<UfModel> ufs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione um estado'),
      ),
      body: ListView.separated(
        itemCount: ufs.length,
        itemBuilder: (_, index) {
          var uf = ufs[index];

          return ListTile(
            onTap: () => Navigator.of(context).pop<UfModel>(uf),
            title: Text(uf.name),
            subtitle: Text(uf.initials),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
