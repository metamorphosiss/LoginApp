import 'package:flutter/material.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});
  final controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText:obscureText ,
        controller: controller,
        decoration:  InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.white),
            ),
            focusedBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: const Color.fromARGB(255, 29, 46, 23),
            filled: true,
            hintText: hintText
            ),
      ),
    );
  }
}
