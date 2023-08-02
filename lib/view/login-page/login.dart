import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/controller/internationlization/languages.dart';
import '../../view-model/login/login_textfiled.dart';
import '../../view-model/login/button_login.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/details/fill-details.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';
import 'package:flutter_application_1/model/login_details.dart';
import 'package:flutter_application_1/view/login-page/show_user_pass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final List<LogInDetails> entering = [];

  void _submitLoginData() {
    if (userNameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text(
              '[please make sure that u have filled both username and password section]'
                  .tr),
          actions: [
            TextButton(
                onPressed: () {
                Get.back();
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }

    if (entering.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text('[please create a user account first!!'.tr),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }
    var isUser = entering
        .where((user) => user.userName == userNameController.text.trim());
    var isPassword = entering
        .where((user) => user.password == passwordController.text.trim());

    if (isUser.isEmpty && isPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text('[wrong username and password please try again!!'.tr),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }

    if (isUser.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text('[wrong username  please try again!!'.tr),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }

    if (isPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text('[wrong password please try again!!'.tr),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }
    Get.to(() => const FillDetails());
  }

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
                    InkWell(
                        onTap: () {
                          Get.to(ShowUserPassList(login: entering));
                        },
                        child: Text('forgot password'.tr)),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              LoginBtn(entering: entering, submit: _submitLoginData),
            ],
          ),
        ),
      ),
    );
  }
}
