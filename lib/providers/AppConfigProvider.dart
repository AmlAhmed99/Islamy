import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage='en';
  bool isDark=false;
  void changeLanguage(String newLanguage){
   if(appLanguage==newLanguage)
     return;
   appLanguage=newLanguage;
   notifyListeners();
  }

  void changeLightMode(){
    isDark= false;
    print(isDark);
    notifyListeners();
  }
  void changeDarkMode(){
    isDark= true;
    print(isDark);
    notifyListeners();
  }
}