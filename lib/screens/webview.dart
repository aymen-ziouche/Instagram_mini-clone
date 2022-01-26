import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:insta_details/constants.dart';

class IgWebView extends StatefulWidget {
  const IgWebView({Key? key}) : super(key: key);
  static String id = "IgWebView";

  @override
  _IgWebViewState createState() => _IgWebViewState();
}

class _IgWebViewState extends State<IgWebView> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.purpleAccent,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://api.instagram.com/oauth/authorize?client_id=" +
            Constants.igClientId +
            "&redirect_uri=" +
            Constants.igRedirectURL +
            "&scope=user_profile,user_media &response_type=code",
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageStarted: (url) {
          print("url is " + url);
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url
              .startsWith("https://aymen-ziouche.github.io/Gaming-website/")) {
            Navigator.pop(context);
          }
          var Value = request.url;
          print(Value);
          var uri = Uri.parse(Value);
          var queryParameters = uri.queryParameters;
          print("this's the code: " + queryParameters.toString());
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
