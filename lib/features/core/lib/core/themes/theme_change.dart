import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  ThemeChange(this._themeData);

  ThemeData _themeData;
  getTheme() => _themeData;

  void setTheme(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
}