import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_auth_example/auth/facebook_signin/facebook_auth_screen.dart';
import 'package:social_auth_example/auth/google_signin/google_signin_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(GoogleAuthScreen());
              },
              child: const Text("Google Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(FaceBookAuthScreen());
              },
              child: const Text("Facebook Screen"),
            )
          ],
        ),
      ),
    );
  }
}
