import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/theme/theme_controller.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  late bool _canPop;

  @override
  void initState() {
    super.initState();

    _canPop = Navigator.canPop(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget trailing = Image.asset('assets/images/logo.png');

    if (_canPop) {
      trailing = IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.maybePop(context);
        },
      );
    }

    final themeController = ThemeController.instance;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            trailing,
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: textTheme.headline1),
                Text('Masterclass Flutterando', style: textTheme.headline3),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: themeController.toggleTheme,
              child: const Icon(
                Icons.dark_mode_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
