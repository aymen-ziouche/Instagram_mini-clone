import 'package:flutter/material.dart';
import 'package:insta_details/constants.dart';
import 'package:insta_details/screens/webview.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kMainColor,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/main_image.png",
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                onPressed: () {
                  Navigator.pushNamed(context, IgWebView.id);
                },
                child: const Text(
                  "LOGIN WITH INSTAGRAM",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
