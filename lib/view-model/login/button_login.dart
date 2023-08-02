import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login-page/sign_up.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';
import 'package:flutter_application_1/model/login_details.dart';

class LoginBtn extends StatelessWidget {
  LoginBtn({super.key, required this.entering, required this.submit});
  final void Function() submit;
  final List<LogInDetails> entering;
  final myController = Get.put(GetMultiLanguage());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            InkWell(
              onTap: submit,
              child: Text(
                'Sign In'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                Get.to(SignUp(
                  enteringData: entering,
                ));
              },
              child: Text(
                 'Sign Up'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
