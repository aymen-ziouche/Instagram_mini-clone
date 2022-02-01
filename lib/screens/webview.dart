import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_details/screens/homepage.dart';
import 'package:insta_details/utils/custom_dio_mixin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:insta_details/constants.dart';

class IgWebView extends StatefulWidget {
  const IgWebView({Key? key}) : super(key: key);
  static String id = "IgWebView";


  @override
  _IgWebViewState createState() => _IgWebViewState();

}

class _IgWebViewState extends State<IgWebView> with CustomDioMixin {
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
            "&scope=user_profile,user_media&response_type=code",
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageStarted: (url) async {

          if (url
              .startsWith("https://aymen-ziouche.github.io/Gaming-website/")) {
            Navigator.pushReplacementNamed(context, HomePage.id);
            // Navigator.pop(context);
            var uri = Uri.parse(url);
            final String? code = uri.queryParameters["code"];
            // getting the access token from the api (exchanging the code for an access token)
            final response = await dio.post(
                'https://api.instagram.com/oauth/access_token',
                options:
                    Options(contentType: Headers.formUrlEncodedContentType),
                data: {
                  'client_id': Constants.igClientId,
                  'client_secret': Constants.igClientSecret,
                  'grant_type': "authorization_code",
                  'redirect_uri': Constants.igRedirectURL,
                  'code': code,
                });
            

            // storing the access token in the device memory
            final storage = GetStorage();
            await Future.wait([
              storage.write("accessToken", response.data["access_token"]),
              storage.write("uid", response.data["user_id"])
            ]);
          }
        },
      ),
    );
  }
}
