import 'package:get/get.dart';
import 'dart:ui';
import 'package:flutter_application_1/model/controller/internationlization/languages.dart';

class GetMultiLanguage extends GetxController{
  void changeLanguage(String param1, String param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
   
  }

}

