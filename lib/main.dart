import 'package:flutter/material.dart';
import 'package:insta_details/screens/homepage.dart';
import 'package:insta_details/screens/login_screen.dart';
import 'package:insta_details/screens/webview.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        HomePage.id: (context) => const HomePage(),
        IgWebView.id: (context) => const IgWebView(),
      },
    );
  }
}
