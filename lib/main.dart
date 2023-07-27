import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/login-page/login.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';
import 'package:flutter_application_1/model/controller/internationlization/massages.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 34, 156, 23),
      brightness: Brightness.dark,
    ));

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Masseges(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Login(),
    );
  }
}
