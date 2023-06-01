import 'package:flutter/material.dart';
import 'package:social_auth_example/auth/both_demo/auth_controller.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
   AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController _authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Auth"),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _authController.signInGoogle();
                  },
                  child: const Text("Google Sign In"),
                ),ElevatedButton(
                  onPressed: () {
                    _authController.signOut();
                  },
                  child: const Text("Google Sign Out"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _authController.logInWithFacebook();
                  },
                  child: const Text("Facebook log In"),
                ),ElevatedButton(
                  onPressed: () {
                    _authController.logOut();
                  },
                  child: const Text("Google Sign Out"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
