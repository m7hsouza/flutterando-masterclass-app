import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

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
