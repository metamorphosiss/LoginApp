import 'package:flutter/material.dart';
import '../../view-model/login/login_textfiled.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';
import 'package:flutter_application_1/model/login_details.dart';

class SignUp extends StatefulWidget {
  const SignUp({required this.enteringData, super.key});
  final List<LogInDetails> enteringData;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _addLogDetails(LogInDetails logInDetails) {
    setState(() {
      widget.enteringData.add(logInDetails);
    });
  }

  void _submitsignUpData() {
    if (int.tryParse(userNameController.text) != null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text(
              '[username can contains number but cant be only number itself.try new one!]'
                  .tr
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
    if (userNameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text(
              '[please make sure that u have filled both username and password section]'
                  .tr
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
    var user = widget.enteringData
        .where((data) => data.userName == userNameController.text.trim());
    if (user.isNotEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid insert'.tr),
          content: Text('[this username is already exist]'.tr),
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
    _addLogDetails(LogInDetails(
        password: passwordController.text, userName: userNameController.text));
    Get.back();
  }

  final myController = Get.put(GetMultiLanguage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'.tr,
          textAlign: TextAlign.start,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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
              const SizedBox(height: 30),
              TextButton(
                  onPressed: _submitsignUpData, child: Text('submit'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
