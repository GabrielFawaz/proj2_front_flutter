import 'dart:ui';

import 'package:get/get.dart';

import '../../Services.dart';


class LocaleController extends GetxController{
  Locale ? language;


  MyServices myServices=Get.find();

  changeLang(String langcode){
    Locale locale=Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }
  // loggedin(String token){
  //   Locale locale=Locale(token);
  //   myServices.sharedPreferences.setString("lang", langcode);
  //   Get.updateLocale(locale);
  // }

  @override
  void onInit(){

    String ? SharedPrefLang=myServices.sharedPreferences.getString("lang");
    if(SharedPrefLang=="ar"){
      language=const Locale("ar");
    }else if(SharedPrefLang=="en"){
      language=const Locale("en");
    }else{
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

}
