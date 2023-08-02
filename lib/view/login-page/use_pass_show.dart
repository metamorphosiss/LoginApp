import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/login_details.dart';

class UserPassShow extends StatelessWidget {
  const UserPassShow(this.login, {super.key});
  final LogInDetails login;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 90, 122, 138),
        Color.fromARGB(66, 90, 99, 117)
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  login.userName,
                ),
                const SizedBox(height: 4),
                Text(
                  login.password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
