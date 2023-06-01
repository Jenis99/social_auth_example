import 'package:flutter/material.dart';
import 'package:social_auth_example/auth/facebook_signin/facebook_auth_controller.dart';
import 'package:get/get.dart';

class FaceBookAuthScreen extends StatelessWidget {
  FaceBookAuthScreen({Key? key}) : super(key: key);
  final FaceBookAuthController _faceBookAuthController = Get.put(FaceBookAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FaceBook LogIn"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {
                _faceBookAuthController.logInWithFacebook();
              },
              child: const Text("FaceBook LogIn"),
            ),
            ElevatedButton(
              onPressed: () {
                _faceBookAuthController.logOut();
              },
              child: const Text("FaceBook LogOut"),
            )
          ],
        ),
      ),
    );
  }
}
