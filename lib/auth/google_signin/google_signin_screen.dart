import 'package:flutter/material.dart';
import 'package:social_auth_example/auth/google_signin/google_sign_controller.dart';
import 'package:get/get.dart';

class GoogleAuthScreen extends StatelessWidget {
   GoogleAuthScreen({Key? key}) : super(key: key);
   final GoogleAuthController _googleAuthController=Get.put(GoogleAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Google Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () async {
                _googleAuthController.signInGoogle();
              },
              child: const Text("Google Login"),
            ),
            ElevatedButton(
              onPressed: () {
                _googleAuthController.logOut();
              },
              child: const Text("Google Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
