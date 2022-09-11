import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:masterclass_app/src/app_widget.dart';
import 'package:masterclass_app/src/common/theme/theme_controller.dart';

void main() {
  timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
  timeago.setLocaleMessages('pt_BR_short', timeago.PtBrShortMessages());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  ThemeController.instance.isDark.addListener(() {
    SystemChrome.setSystemUIOverlayStyle(ThemeController.instance.isDark.value ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  });

  runApp(const AppWidget());
}
