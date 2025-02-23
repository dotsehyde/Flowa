import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController _instance = ThemeController._();
  ThemeController._();
  factory ThemeController() => _instance;

  ThemeMode themeMode =
      getStringAsync("theme", defaultValue: "light") == "light"
          ? ThemeMode.light
          : ThemeMode.dark;
  void changeThemeMode(ThemeMode mode) async {
    themeMode = mode;
    await setValue("theme", mode == ThemeMode.dark ? "dark" : "light");
    notifyListeners();
  }
}
