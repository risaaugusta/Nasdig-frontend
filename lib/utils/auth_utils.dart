import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:Pegassus/utils/network_utils.dart';

class AuthUtils {
  static saveUserAuthToken(var resp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(globals.authTokenKey, resp['data']['token']);
    prefs.setBool(globals.verifiedKey, resp['data']['verified']);
  }

  static updateUserProfile(var resp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(globals.usernameKey, resp['data']['username']);
    prefs.setString(globals.nameKey, resp['data']['name']);
    prefs.setString(globals.initialsKey, resp['data']['initials']);
  }

  static registerUserDeviceToken(String authToken) async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    _firebaseMessaging.getToken().then((deviceToken) async {
      String ep = globals.epDonorRegisterDevice;
      Object body = {'deviceToken': deviceToken};
//      NetworkUtils.httpPost(ep, body, authToken);
      var resJson = await NetworkUtils.httpPost(ep, body, authToken);
      if (resJson['status'] == 'SUCCESS') {
        print('SUCCESS: Register FCM token $deviceToken');
      } else {
        print('FAILED: Register FCM token $deviceToken');
      }
    });
  }

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(globals.authTokenKey);
  }

  static String getUsername(SharedPreferences prefs) {
    return prefs.getString(globals.usernameKey);
  }

  static String getName(SharedPreferences prefs) {
    return prefs.getString(globals.nameKey);
  }

  static String getInitials(SharedPreferences prefs) {
    return prefs.getString(globals.initialsKey);
  }

  static setVerified(bool verified) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(globals.verifiedKey, verified);
  }

  static bool getVerified(SharedPreferences prefs) {
    return prefs.getBool(globals.verifiedKey);
  }
}
