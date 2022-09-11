import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.iconUrl, this.onTap}) : super(key: key);

  final String iconUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(iconUrl),
      ),
    );
  }
}
