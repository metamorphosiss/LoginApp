import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/controller/internationlization/languages.dart';
import '../../view-model/login/login-textfiled.dart';
import '../../view-model/login/button-login.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/details/fill-details.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  void _signInuser() {}
  final myController = Get.put(GetMultiLanguage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'login page'.tr,
            textAlign: TextAlign.start,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Languages>(
                  underline: const SizedBox(),
                  icon: const Icon(Icons.language, color: Colors.white),
                  onChanged: (Languages? languages) {
                    if (languages != null) {
                      myController.changeLanguage(
                          languages.languageCode, languages.country);
                    }
                  },
                  items: Languages.languageList()
                      .map<DropdownMenuItem<Languages>>(
                        (e) => DropdownMenuItem<Languages>(
                          value: e,
                          child: Row(
                            children: <Widget>[Text(e.name.toUpperCase())],
                          ),
                        ),
                      )
                      .toList()),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Welcome to my demo App'.tr,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 60),
                LoginTextFiled(
                  obscureText: false,
                  controller: userNameController,
                  hintText: 'user name'.tr,
                ),
                const SizedBox(height: 30),
                LoginTextFiled(
                  obscureText: true,
                  controller: passwordController,
                  hintText: 'password'.tr,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('forgot password'.tr),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                LoginBtn(onTap: () {}),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                  onPressed: () {
                    Get.to(() => const FillDetails());
                  },
                  label: Text('go to main page'.tr)),
            ],
          ),
        ));
  }
}
