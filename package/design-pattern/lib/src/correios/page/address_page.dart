import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:design_pattern/src/correios/service/address_service.dart';
import 'package:design_pattern/src/correios/store/address_store.dart';
import 'package:uno/uno.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late final AddressStore _store;

  @override
  void initState() {
    super.initState();

    var httpClient = Uno();
    var service = AddressService(httpClient);
    _store = AddressStore(service);
  }

  Widget _buildInfo(String label, String value) {
    return Text.rich(
      TextSpan(
        text: '$label: ',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encontar endereço pelo CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            TextField(
              onChanged: _store.changeZipCode,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '69000000',
                labelText: 'CEP',
                suffixIcon: GestureDetector(
                  onTap: _store.findAddressByZipCode,
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: _store,
              builder: (_, __) {
                var state = _store.state;
                if (state == StoreState.idle) {
                  return const Text(
                    'Digite um CEP para pesquisar o endereço.',
                    style: TextStyle(fontSize: 16),
                  );
                }

                if (state == StoreState.error) {
                  return Text(
                    'Ocorreu um error verifique o CEP e tente novamente.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Theme.of(context).errorColor),
                  );
                }

                if (state == StoreState.loading) return const CircularProgressIndicator(strokeWidth: 8);

                var address = _store.address!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfo('CEP', address.zipCode),
                    _buildInfo('Estado', address.uf),
                    _buildInfo('Cidade', address.city),
                    _buildInfo('Rua', address.street),
                    _buildInfo('Bairro', address.neighborhood),
                    _buildInfo('DDD', address.ddd),
                  ],
                );
              },
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
