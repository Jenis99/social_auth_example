import 'dart:io';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthController extends GetxController {
  GoogleSignInAccount? _googleUser;

  /// Google Log In Without Firebase but use OAuth client ID
  /// 1. add or create app on google cloud console
  /// 2. Credential Tap on +create Credential select OAuth client ID--> select your app type--> after that fill necessary info...
  /// 3. In Google Sign in you must add client id when you call the login method
  /// 4. Android---- in that android client id is not supported for that you need to create webapp in console after create webapp you get--
  /// serverClientId but that id show on client id you add that webApp clientId for google sign in request
  /// 5. IOS----in IOS no issue for client id is supported in that

  Future<void> signInGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isAndroid
            ? "251627097738-mf377i2qupr8omv8o1rks0l0ja4vplh9.apps.googleusercontent.com" /*--- this is webapp client Id for Android because android client id is not supported*/
            : "251627097738-f6jpioage37i6s6c37umohvi2h31golk.apps.googleusercontent.com",
        /*--- this is IOS client Id for IOS*/
        scopes: [
          'email',
        ],

        ///TODO: put scopes app will use
      );

      /// if previously signed in, it will signin silently
      /// if not, the signin dialog/login page will pop up
      _googleUser = await googleSignIn.signInSilently() ?? await googleSignIn.signIn();

      // var token = (await googleSignIn.currentUser!.authentication).idToken;
      // print("token :- $token");

      var userAuth = await _googleUser?.authentication;
      print("userTokenData idToken :${userAuth?.idToken}");
      print("google signing successful");
    } catch (e) {
      print("error--------->${e.toString()}");
    }
  }

  Future<void> logOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _googleUser = null;
  }
}
