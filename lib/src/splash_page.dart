import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacementNamed('/home');
    });

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
