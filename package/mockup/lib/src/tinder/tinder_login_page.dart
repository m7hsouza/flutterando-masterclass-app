import 'package:flutter/material.dart';

import 'tinder_signin_button.dart';

class TinderLoginPage extends StatelessWidget {
  const TinderLoginPage({Key? key}) : super(key: key);

  final BoxDecoration _decoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
      colors: [
        Color(0xFFEA4F77),
        Color(0xFFED7265),
      ],
    ),
  );

  final TextStyle _underlineStyle = const TextStyle(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        child: Container(
          decoration: _decoration,
          child: Stack(
            children: [
              const Positioned(
                left: 4,
                top: 24,
                child: BackButton(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(flex: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: Image.asset('assets/images/tinder-logo.png'),
                    ),
                    const Spacer(flex: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text.rich(
                        TextSpan(
                          text: 'By tapping Create Account or Sign In, you agree to our ',
                          children: [
                            TextSpan(text: 'Terms', style: _underlineStyle),
                            const TextSpan(text: '. Learn how we process your data in our '),
                            TextSpan(text: 'Privacy Policy', style: _underlineStyle),
                            const TextSpan(text: ' and '),
                            TextSpan(text: 'Cookies Policy.', style: _underlineStyle),
                          ],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const TinderSignInButton(iconPath: 'assets/icons/apple.png', label: 'SIGN IN WITH APPLE'),
                    const SizedBox(height: 8),
                    const TinderSignInButton(iconPath: 'assets/icons/facebook.png', label: 'SIGN IN WITH FACEBOOK'),
                    const SizedBox(height: 8),
                    const TinderSignInButton(
                        iconPath: 'assets/icons/speech-bubble.png', label: 'SIGN IN WITH PHONE NUMBER'),
                    const Spacer(),
                    const Text('Trouble Signing In?'),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
