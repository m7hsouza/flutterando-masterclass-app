import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.child,
    this.margin,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? margin;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Widget current = SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: child,
      ),
    );

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return current;
  }
}
