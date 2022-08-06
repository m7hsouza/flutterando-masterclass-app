import 'package:flutter/material.dart';

class AppMoneyLogoWidget extends StatelessWidget {
  const AppMoneyLogoWidget({required this.size, required this.color, Key? key}) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final gap = size * 0.03;
    final square = size * 0.45;

    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned(
            top: gap,
            left: gap,
            child: Container(
              width: square,
              height: square,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: gap,
            left: gap,
            child: Container(
              width: square,
              height: square,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size),
                ),
              ),
            ),
          ),
          Positioned(
            right: gap,
            top: gap,
            child: Container(
              width: square,
              height: square * 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size),
                  topRight: Radius.circular(size),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
