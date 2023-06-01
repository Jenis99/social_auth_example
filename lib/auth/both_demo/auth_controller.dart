import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLoggedIn = false.obs;
  GoogleSignInAccount? _googleUser;
  Map<String, dynamic>? _userData;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkIfIsLogged();
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Future<void> signInGoogle() async {
    try {
      print("google signing start");

      GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isAndroid
            ? "251627097738-mf377i2qupr8omv8o1rks0l0ja4vplh9.apps.googleusercontent.com"
            : "251627097738-f6jpioage37i6s6c37umohvi2h31golk.apps.googleusercontent.com",
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

      print("google signing successful");
      var userAuth = await _googleUser?.authentication;
      print("userTokenData idToken :${userAuth?.idToken}");
      print("google signing successful");
    } catch (e) {
      print("error--------->${e.toString()}");
    }
  }

  Future<void> checkIfIsLogged() async {
    try {
      final accessToken = await FacebookAuth.instance.accessToken;
      isLoading.value = false;
      if (accessToken != null) {
        isLoggedIn.value = true;
        print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
        // now you can call to  FacebookAuth.instance.getUserData();
        final userData = await FacebookAuth.instance.getUserData();
        // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
        _userData = userData;
        print("UserData ---- > ${_userData}");
      } else {
        print("Not Logged IN");
      }
    } on Exception catch (e) {
      print("error--> $e");
      // TODO
    }
  }



  ///  Steps For Facebook Login Without Firebase
  ///  1. First of all you need to add or create app on facebook developer console
  /// 2. then install flutter_facebook_auth package for that
  /// 3. follow all steps as given in flutter_facebook_auth readme section
  /// 4. in facebook console in setting->Basic you get appId and appSecret after that second option is advance option in Setting you get client token
  /// 5. after that in Products select QuickStart -> select you app type like IOS or Android
  /// 6. follow all step you must enter all element and permission which is given in that
  /// NOTE: If you forgot any element and permission then you have error like as Below
  /// **** ERROR: MissingPluginException(No implementation found for method getAccessToken on channel app.meedu/flutter_facebook_auth)

  Future<void> logInWithFacebook() async {
    try {
      FacebookAuth facebookAuth = FacebookAuth.instance;
      final LoginResult result =
      await facebookAuth.login(permissions: ['email', 'public_profile']);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        print("accessToken: ${accessToken.token}");

      } else {
        log("result.status: ${result.status}");
        log("result.message: ${result.message}");
      }
    } catch (e, st) {
      log("error e:$e - st: $st");
    }
  }



  Future<void> logOut() async {
    try {
      await FacebookAuth.instance.logOut();
      _userData = null;
      isLoggedIn.value = false;
      print("logout");
    } on Exception catch (e) {
      print("when logout Error${e}");
      // TODO
    }
  }


  ///sign out from google
  Future<void> signOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    _googleUser = null;
  }
}
