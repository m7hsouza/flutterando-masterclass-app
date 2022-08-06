import 'package:flutter/material.dart';

import 'navigation_bar_item_custom.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({required this.items, this.selectedIndex = 0, this.onSelectedItem, Key? key})
      : super(key: key);

  final List<NavigationBarItemCustom> items;
  final int selectedIndex;
  final void Function(int)? onSelectedItem;

  List<Widget> _itemsBuilder(BuildContext context) {
    final children = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      children.add(
        Expanded(
          child: GestureDetector(
            onTap: onSelectedItem != null ? () => onSelectedItem!(i) : null,
            child: items[i],
          ),
        ),
      );

      if (i != items.length - 1) {
        children.add(Container(color: Theme.of(context).dividerColor, width: 1));
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / items.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              // left: itemWidth * (selectedIndex + 1) - (itemWidth / 2) - (itemWidth / 4),
              left: (itemWidth - (itemWidth / 2) - 30) + (selectedIndex * itemWidth),
              top: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const SizedBox(width: 60, height: 30),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _itemsBuilder(context),
            ),
          ],
        ),
      ),
    );
  }
}
