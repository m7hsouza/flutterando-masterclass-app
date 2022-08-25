import 'package:flutter/material.dart';

import 'package:design_pattern/src/ibge/model/uf_model.dart';
import 'package:design_pattern/src/ibge/page/ibge_store.dart';
import 'package:design_pattern/src/ibge/page/list_ufs_page.dart';
import 'package:design_pattern/src/ibge/repository/ibge_repository.dart';
import 'package:design_pattern/src/ibge/repository/remote_datasource.dart';

class IBGEPage extends StatefulWidget {
  const IBGEPage({Key? key}) : super(key: key);

  @override
  State<IBGEPage> createState() => _IBGEPageState();
}

class _IBGEPageState extends State<IBGEPage> {
  late final IBGEStore _store;

  @override
  void initState() {
    super.initState();

    var repository = IBGERepository(RemoteDatasource());
    _store = IBGEStore(repository);

    _loadUfs();
  }

  Future<void> _loadUfs() async {
    await _store.loadAllUfs();
  }

  Future<void> _openModalSelectUf() async {
    var result = await Navigator.push<UfModel>(
      context,
      MaterialPageRoute(builder: ((_) => ListUfsPage(_store.ufs))),
    );

    if (result == null) return;

    await _store.findCitiesByUf(result.initials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Municipios'),
        actions: [
          GestureDetector(
            onTap: _openModalSelectUf,
            child: const Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _store,
        builder: (_, __) {
          var state = _store.state;

          if (state == IBGEStates.idle) {
            return Center(
              child: ElevatedButton(
                onPressed: _openModalSelectUf,
                child: const Text('Escolher um Estado'),
              ),
            );
          }

          if (state == IBGEStates.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state == IBGEStates.error) {
            return Center(
              child: Text(
                'Ocorreu um erro, verifique a conexão e tente novamente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          }

          var cities = _store.cities;
          return ListView.separated(
            itemCount: cities.length,
            itemBuilder: (_, index) {
              var city = cities[index];

              return ListTile(
                title: Text(city.name),
                subtitle: Text(city.microregion),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
