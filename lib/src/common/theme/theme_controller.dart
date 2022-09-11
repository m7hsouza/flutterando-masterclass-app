import 'package:flutter/material.dart';

class ThemeController {
  ThemeController._();

  static final instance = ThemeController._();

  ValueNotifier<bool> isDark = ValueNotifier(true);

  void toggleTheme() {
    isDark.value = !isDark.value;
  }
}
