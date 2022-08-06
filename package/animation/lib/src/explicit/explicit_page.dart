import 'package:flutter/material.dart';

import 'custom_expansion_tile.dart';

class ExplicitPage extends StatefulWidget {
  const ExplicitPage({Key? key}) : super(key: key);

  @override
  State<ExplicitPage> createState() => _ExplicitPageState();
}

class _ExplicitPageState extends State<ExplicitPage> {
  int? _selectedIndex;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Animação Controlada',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: 50,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () => _onTap(i),
                      child: CustomExpansionTile(
                        title: 'My Expansion Tile $i',
                        isOpen: _selectedIndex == i,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
