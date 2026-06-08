import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{


  String appLanguage="en";

  void changeAppLanguage(String newLangue){
    if(appLanguage==newLangue) {
      return ;
    }
    appLanguage=newLangue;

    notifyListeners();
  }
}