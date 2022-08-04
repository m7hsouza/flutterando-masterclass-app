import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color(0xFF121517),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 72),
        child: Center(
          child: Image(
            image: AssetImage('assets/images/masterclass_logo.png'),
          ),
        ),
      ),
    );
  }
}
