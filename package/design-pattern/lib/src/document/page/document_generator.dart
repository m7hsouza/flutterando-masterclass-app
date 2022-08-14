import 'package:flutter/material.dart';

import '../store/document_store.dart';

class DocumentGenerator extends StatelessWidget {
  DocumentGenerator({Key? key}) : super(key: key);

  final DocumentStore store = DocumentStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de CPF'),
        actions: [
          AnimatedBuilder(
            animation: store,
            builder: (_, __) {
              return Switch(
                value: store.showFormattedValue,
                onChanged: store.changeShowFormattedValue,
              );
            },
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: store,
                builder: (_, __) {
                  var document = store.document;

                  if (document == null) {
                    return const Text(
                      'clique no botão abaixo para gerar um cpf',
                      textAlign: TextAlign.center,
                    );
                  }

                  return Text(store.showFormattedValue ? document.formattedValue : document.value);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: store.generateNewDocument,
                child: const Text('Gerar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
