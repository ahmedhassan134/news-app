import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{


  ThemeMode themeApp=ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme){
    if(themeApp==newTheme){
      return;
    }
    themeApp=newTheme;
    notifyListeners();

  }
  bool get isDark =>themeApp==ThemeMode.dark;
}