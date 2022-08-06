import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/theme/theme_controller.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Navigator.of(context).canPop()
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  )
                : Image.asset('assets/images/logo.png'),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.headline1),
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
