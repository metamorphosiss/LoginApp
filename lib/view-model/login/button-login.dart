import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';

class LoginBtn extends StatelessWidget {
   LoginBtn({super.key,required this.onTap});
    final Function()? onTap;
 final myController = Get.put(GetMultiLanguage());
@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
            child: Text(
            'Sign In'.tr,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
    );
  }
}