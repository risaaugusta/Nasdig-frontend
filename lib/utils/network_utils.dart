import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

//import 'package:nasdem/pages/pay/onetime/onetime_amount.dart';
//import 'package:nasdem/components/route_transition.dart';
import 'package:Pegassus/utils/db_keyvalue.dart';
import 'globals.dart' as globals;

var headers = {
  'Authorization': globals.basicAuth,
  'x-source-channel': globals.xSourceChannel,
};

class NetworkUtils {
  static httpPost(String uri, Object body, [String authToken]) async {
    var resJson, msg;
    if (authToken != null) {
      headers['x-access-token'] = authToken;
    } else {
      headers.remove('x-access-token');
    }
    print('uri $uri');
//    print('headers $headers');
    print('body $body');

    try {
      final response = await http.post(uri, headers: headers, body: body);
      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }

  static httpGet(String uri, [String authToken]) async {
    var resJson, msg;
    if (authToken != null) {
      headers['x-access-token'] = authToken;
    } else {
      headers.remove('x-access-token');
    }
    //    print('authToken $authToken');
    print('uri $uri');
    print('headers $headers');

    try {
      final response = await http.get(uri, headers: headers);
      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }

  static httpDelete(String uri, [String authToken]) async {
    var resJson, msg;
    if (authToken != null) {
      headers['x-access-token'] = authToken;
    } else {
      headers.remove('x-access-token');
    }
    print('uri $uri');
//    print('headers $headers');

    try {
      final response = await http.delete(uri, headers: headers);

      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }

  static httpPatch(String uri, Object body, [String authToken]) async {
    var resJson, msg;
    if (authToken != null) {
      headers['x-access-token'] = authToken;
    } else {
      headers.remove('x-access-token');
    }
    print('uri $uri');
//    print('headers $headers');

    try {
      final response = await http.patch(uri, headers: headers, body: body);

      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }

  static multipartRequest(String uri, String keyName, File file,
      [String authToken]) async {
    var resJson, msg;
    if (authToken != null) {
      headers['x-access-token'] = authToken;
    } else {
      headers.remove('x-access-token');
    }
    print('uri $uri');
//    print('headers $headers');
//    print('filename $file');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(uri));
      request.files.add(await http.MultipartFile.fromPath(keyName, file.path));
      request.headers.addAll(headers);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final respStrJdecode = json.decode(respStr);
      print('response $response');
      print('respStr $respStr');
      print('statusCode ${response.statusCode}');

      if (response.statusCode == 200) {
        resJson = respStrJdecode;
      } else {
        String msg = response.reasonPhrase != ''
            ? response.reasonPhrase
            : respStrJdecode['message'];
        resJson = {
          'status': 'ERROR',
          'data': {},
          'message': msg,
        };
      }

//      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }

  static getLocalApiValue(String key) async {
    var resJson, msg;
    DbHelperKeyvalue helper = DbHelperKeyvalue.instance;
    Keyvalue keyval = await helper.query(key);
    if (keyval == null) {
      msg = 'No offline data available.';
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    } else {
      resJson = json.decode(keyval.value);
    }
    print('resJsonLocal $resJson');
    return resJson;
  }

  static setLocalApiValue(String key, dynamic value) async {
    // insert or update
    Keyvalue newKeyval = Keyvalue();
    newKeyval.key = key;
    newKeyval.value = json.encode(value); // encode to string
    DbHelperKeyvalue helper = DbHelperKeyvalue.instance;
    int id = await helper.insertOrUpdate(newKeyval);
//    print('saved id $id');
    return id;
  }

  static logoutUser(BuildContext context, String authToken,
      [String logoutMsg]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // remove db table
    DbHelperKeyvalue helper = DbHelperKeyvalue.instance;
    helper.removeDbTable();

    // remove device id
    if (authToken != null) {
      String ep = globals.epDonorRegisterDevice;
      Object body = {'deviceToken': '0'};
      var resJson = await NetworkUtils.httpPost(ep, body, authToken);
      if (resJson['status'] == 'SUCCESS') {
        print('SUCCESS: Remove FCM token');
      } else {
        print('FAILED: Remove FCM token');
      }
    }
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey,
      [String message, String type = 'INFO']) {
    Color backgroundColor = Colors.black87;
    switch (type.toUpperCase()) {
      case 'SUCCESS':
        backgroundColor = Colors.green[600];
        break;
      case 'ERROR':
        backgroundColor = Colors.red[900];
        break;
    }
    if (message == globals.msgFailedLoadData) {
      // do not show snackbar on Failed to load data
      print('Do not show snackbar on: $message');
    } else {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          duration: Duration(seconds: 5),
          content: Text(
            message ?? globals.msgNoInternet,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }

  static launchURL(String url,
      [bool forceSafariVC = true, bool forceWebView = true]) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: forceSafariVC, forceWebView: forceWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  static messageSetOpened(String messageId, String authToken) async {
    var resJson, msg;
    headers['x-access-token'] = authToken;

    String uri = '${globals.epMessageSetOpened}/$messageId';
    print('uri $uri');
//    print('headers $headers');

    try {
      final response = await http.get(uri, headers: headers);
      resJson = json.decode(response.body);
    } catch (exception) {
      print(exception);
      msg = exception.toString().contains('SocketException')
          ? globals.msgNoInternet
          : globals.msgFailedLoadData;
      resJson = {
        'status': 'ERROR',
        'data': {},
        'message': msg,
      };
    }
    print('resJson $resJson');
    return resJson;
  }
}
