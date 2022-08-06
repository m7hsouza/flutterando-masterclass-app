import 'dart:math';

import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({required this.title, required this.isOpen, Key? key}) : super(key: key);

  final String title;
  final bool isOpen;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<double> _heightFactor;
  late Animation<double> _angleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _angleAnimation = Tween<double>(begin: 0, end: pi).animate(_controller);

    _heightFactor = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 1),
    ));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: IconTheme.of(context).color,
                ),
              ),
              AnimatedBuilder(
                animation: _angleAnimation,
                builder: (_, __) {
                  return Transform.rotate(
                    angle: _angleAnimation.value,
                    child: const Icon(Icons.keyboard_arrow_down),
                  );
                },
              )
            ],
          ),
          AnimatedBuilder(
            animation: _heightFactor,
            builder: (_, __) {
              return ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: FlutterLogo(size: 40),
                    ),
                    subtitle: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).dividerColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
