import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app_money_logo_widget.dart.dart';

class AppMoneyLoginPage extends StatelessWidget {
  AppMoneyLoginPage({Key? key}) : super(key: key);

  final _signInOnTap = TapGestureRecognizer()
    ..onTap = () {
      debugPrint('Sign...');
    };

  void _onTapSignUpWithEmail() => debugPrint('Sign up with email ID');

  void _onTapSignUpWithGoogle() => debugPrint('Sign up with google');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = math.max<double>(125, math.min(width * 0.4, 275));
    final buttonWidth = math.max<double>(300, math.min(width * 0.55, 400));

    return Material(
      color: Colors.black,
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(color: Colors.white),
              ),
              const Spacer(flex: 5),
              AppMoneyLogoWidget(color: const Color(0xFF605FAF), size: size),
              const Spacer(),
              const Text(
                'Get your Money\nUnder Control',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                'Manage your expenses.\nSeamlessly.',
                style: TextStyle(fontSize: 18, color: Color(0xFF808082)),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: buttonWidth,
                height: 40,
                child: ElevatedButton(
                  onPressed: _onTapSignUpWithEmail,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    primary: const Color(0xFF605FAF),
                  ),
                  child: const Text(
                    'Sign Up with Email ID',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: buttonWidth,
                height: 40,
                child: ElevatedButton(
                  onPressed: _onTapSignUpWithGoogle,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), primary: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google.png', width: 24),
                      const SizedBox(width: 16),
                      const Text(
                        'Sign Up with Google',
                        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D)),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Text.rich(
                TextSpan(
                  text: 'Already have an account?',
                  children: [TextSpan(text: 'Sign In', recognizer: _signInOnTap)],
                ),
              ),
              const Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
