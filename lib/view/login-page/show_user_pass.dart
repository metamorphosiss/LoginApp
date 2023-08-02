import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/login_details.dart';
import 'package:flutter_application_1/view/login-page/use_pass_show.dart';
import 'package:get/get.dart';

class ShowUserPassList extends StatelessWidget {
  const ShowUserPassList({required this.login, super.key});
  final List<LogInDetails> login;
  @override
  Widget build(BuildContext context) {
    Widget toggleContent =
        Center(child: Text('there is no user account yet!!!'.tr));
    if (login.isNotEmpty) {
      toggleContent = ListView.builder(
        itemCount: login.length,
        itemBuilder: (ctx, index) => (UserPassShow(login[index])),
      );
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('showing user account'.tr)),
          body: toggleContent),
    );
  }
}
