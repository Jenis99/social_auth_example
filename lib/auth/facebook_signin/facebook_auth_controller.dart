import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FaceBookAuthController extends GetxController{
  Map<String, dynamic>? _userData;
  RxBool isLoggedIn = false.obs;


  ///  Steps For Facebook Login Without Firebase
  ///  1. First of all you need to add or create app on facebook developer console
  /// 2. then install flutter_facebook_auth package for that
  /// 3. follow all steps as given in flutter_facebook_auth readme section
  /// 4. in facebook console in setting->Basic you get appId and appSecret after that second option is advance option in Setting you get client token
  /// 5. after that in Products select QuickStart -> select you app type like IOS or Android
  /// 6. follow all step you must enter all element and permission which is given in that
  /// NOTE: If you forgot any element and permission then you have error like as Below
  /// **** ERROR: MissingPluginException(No implementation found for method getAccessToken on channel app.meedu/flutter_facebook_auth)
  /// and one more in app facebook account of admin/tester which is add on facebook console is logged in facebook app

  Future<void> logInWithFacebook() async {
    try {
      FacebookAuth facebookAuth = FacebookAuth.instance;
      final LoginResult result =
      await facebookAuth.login(permissions: ['email', 'public_profile']);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        print("accessToken: ${accessToken.token}");

      } else {
        print("result.status: ${result.status}");
        print("result.message: ${result.message}");
      }
    } catch (e, st) {
      print("error e:$e - st: $st");
    }
  }



  Future<void> logOut() async {
    try {
      await FacebookAuth.instance.logOut();
      _userData = null;
      isLoggedIn.value = false;
    } on Exception catch (e) {
      print("Error:---> ${e}");
      // TODO
    }
  }
}