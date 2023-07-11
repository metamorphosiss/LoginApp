import 'package:flutter/material.dart';
import '../../view-model/login/login-textfiled.dart';
import '../../view-model/login/button-login.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/details/fill-details.dart';

class Login extends StatelessWidget {
   Login({super.key});
final userNameController = TextEditingController();
final passwordController = TextEditingController();
void _signInuser(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children:  [
             const Text(
                'Welcome to my demo App',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 60),
              LoginTextFiled(
                obscureText: false,
                controller: userNameController,
                hintText: 'user name',
              ),
              const SizedBox(height:30),
              LoginTextFiled(
                obscureText: true,
                controller: passwordController,
                hintText: 'password',
              ),
          const SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
               mainAxisAlignment : MainAxisAlignment.end,
              children: const[
                 Text('forget password '),
              ],
            ),
          ),
            const SizedBox(height:25),
             LoginBtn(onTap:(){} ),
            ],
          ),
        ),
      ),
   floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
           Get.to(()=>  
             const FillDetails()
             );
          },
          label: const Text('go to main page')),
    );
  }
}
