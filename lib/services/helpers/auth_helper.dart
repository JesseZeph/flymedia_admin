import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/requests/auth/login_request.dart';
import 'package:flymedia_admin/models/requests/auth/verification_code.dart';
import 'package:flymedia_admin/models/response/login_response.dart';
import 'package:flymedia_admin/models/response/signup_response.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> signUp(String model) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

      var url = Uri.https(Config.apiUrl, Config.superAdminSignupUrl);
      var response =
          await client.post(url, headers: requestHeaders, body: model);
      if (response.statusCode == 201) {
        SignupResponse signupResponse =
            SignupResponse.fromJson(jsonDecode(response.body));

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', signupResponse.user!.email!);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("===> signup error: ${e.toString()}");
      return false;
    }
  }

  static Future<List<dynamic>> login(String model) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.loginUrl);
      print(url);

      var response =
          await client.post(url, headers: requestHeaders, body: model);

      var decodedResponse = jsonDecode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        var user = loginResponseModelFromJson(response.body);
        await prefs.setString('token', user.userToken);
        await prefs.setString('userId', user.id);
        await prefs.setString('uid', user.uid);
        await prefs.setString('profile', user.profile);
        await prefs.setString('email', user.email);
        await prefs.setString('fullname', user.fullname);

        await prefs.setBool('loggedIn', true);
        return [true];
      } else {
        return [false, decodedResponse['message']];
      }
    } catch (e, s) {
      debugPrint("==> login error: ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }
    return [false, 'An error occured. Try again later.'];
  }

  static Future<bool> verifyEmail(VerificationCode model) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      var url = Uri.https(Config.apiUrl, Config.verifyEmail);
      var response = await client.patch(url,
          headers: requestHeaders, body: json.encode(model.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
