import 'package:flutter/material.dart';

import 'package:masterclass_app/src/common/theme/dark_theme.dart';
import 'package:masterclass_app/src/common/theme/light_theme.dart';
import 'package:masterclass_app/src/common/theme/theme_controller.dart';
import 'package:masterclass_app/src/feature/home/home_page.dart';
import 'package:masterclass_app/src/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.instance.isDark,
      builder: (_, bool isDark, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: LightTheme.schema,
          darkTheme: DarkTheme.schema,
          routes: {
            '/splash': (context) => const SplashPage(),
            '/': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
