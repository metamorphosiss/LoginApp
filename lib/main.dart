import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/login-page/login.dart';
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 156, 23),
   brightness: Brightness.dark,
   )
);

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App ({super.key});
@override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
    
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Login() ,
    );
  }
}


