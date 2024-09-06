import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModeProvider extends ChangeNotifier {
  static ThemeModeProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<ThemeModeProvider>(context, listen: listen);
  }

  ThemeMode mode = ThemeMode.system;

  toggleThemeMode(bool value) {
    if (!value) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
