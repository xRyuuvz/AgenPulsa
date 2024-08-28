// ignore_for_file: recursive_getters
import 'package:agenpulsa/theme/dark_mode.dart';
import 'package:agenpulsa/theme/light_mode.dart';
import 'package:flutter/material.dart';



class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
