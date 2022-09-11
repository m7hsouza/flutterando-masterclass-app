import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:masterclass_app/src/app_widget.dart';
import 'package:masterclass_app/src/common/theme/theme_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  ThemeController.instance.isDark.addListener(() {
    SystemChrome.setSystemUIOverlayStyle(ThemeController.instance.isDark.value ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  });

  runApp(const AppWidget());
}
