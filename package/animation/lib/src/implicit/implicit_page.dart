import 'package:flutter/material.dart';

class ImplicitPage extends StatefulWidget {
  const ImplicitPage({Key? key}) : super(key: key);

  @override
  State<ImplicitPage> createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {
  final _duration = const Duration(milliseconds: 600);

  bool _isCircle = true;

  @override
  Widget build(BuildContext context) {
    var buttonSize = MediaQuery.of(context).size.width * 0.2;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          'Animação Implicita',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: AnimatedAlign(
          duration: _duration,
          curve: Curves.easeOut,
          alignment: _isCircle ? Alignment.bottomRight : Alignment.topCenter,
          child: AnimatedContainer(
            duration: _duration,
            curve: Curves.easeOut,
            width: _isCircle ? buttonSize : buttonSize * 2,
            height: _isCircle ? buttonSize : buttonSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_isCircle ? 100 : 8),
              color: Theme.of(context).primaryColor,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isCircle = !_isCircle;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
