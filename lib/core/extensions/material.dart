import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension XThemeMode on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
}
