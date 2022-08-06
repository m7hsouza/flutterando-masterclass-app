import 'package:flutter/material.dart';

class NavigationBarItemCustom extends StatelessWidget {
  const NavigationBarItemCustom({required this.icon, required this.label, Key? key}) : super(key: key);

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 24, height: 24, child: icon),
        const SizedBox(height: 2),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
