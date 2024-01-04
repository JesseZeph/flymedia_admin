import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordHelper extends ChangeNotifier {
  var client = http.Client();
  bool _isloading = false;
  bool get isloading => _isloading;
  String? recoveryMail;

  String? get mail => recoveryMail;
  set recoverMail(String? mail) {
    recoveryMail = mail;
  }

  Future<List<dynamic>> forgotPassword(String email) async {
    _isloading = !_isloading;
    notifyListeners();
    try {
      final response = await http.post(
          Uri.http(Config.apiUrl, Config.forgotPassword),
          body: {"email": email});
      final decodedResponse = jsonDecode(response.body);
      _isloading = !_isloading;
      notifyListeners();
      return [
        decodedResponse['status'] == 'Success',
        decodedResponse['message'],
      ];
    } catch (e, s) {
      debugPrint("Error with forgot password : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }
    _isloading = !_isloading;
    notifyListeners();
    return [false, 'An error occured'];
  }

  Future<List<dynamic>> verifyOtp(String code) async {
    _isloading = !_isloading;
    notifyListeners();
    try {
      final response = await http.post(
          Uri.https(Config.apiUrl, Config.verifyOtp),
          body: {"verificationCode": code});
      final decodedResponse = jsonDecode(response.body);
      _isloading = !_isloading;
      notifyListeners();
      return [response.statusCode == 200, decodedResponse['message']];
    } catch (e, s) {
      debugPrint("Error with verify otp : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }
    _isloading = !_isloading;
    notifyListeners();
    return [false, "An error occured"];
  }

  Future<List<dynamic>> resendOtp() async {
    _isloading = !_isloading;
    notifyListeners();
    try {
      final response = await http.post(
          Uri.https(Config.apiUrl, Config.resendOtp),
          body: {"email": recoveryMail});
      final decodedResponse = jsonDecode(response.body);
      _isloading = !_isloading;
      notifyListeners();
      return [response.statusCode == 200, decodedResponse['message']];
    } catch (e, s) {
      debugPrint("Error with verify otp : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }
    _isloading = !_isloading;
    notifyListeners();
    return [false, "An error occured"];
  }

  Future<List<dynamic>> resetPassword(String newPassword) async {
    _isloading = !_isloading;
    notifyListeners();
    String userType = '';
    try {
      final response = await http.patch(
          Uri.https(Config.apiUrl, Config.resetPassword),
          body: {"email": recoveryMail, "newPassword": newPassword});
      final decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userType = decodedResponse['userType'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', decodedResponse['userToken']);
        await prefs.setString('userId', decodedResponse['_id']);
        await prefs.setString('uid', decodedResponse['uid']);
        await prefs.setString('profile', decodedResponse['profile']);
        await prefs.setString('fullname', decodedResponse['fullname']);
        await prefs.setBool('loggedIn', true);
      }
      _isloading = !_isloading;
      notifyListeners();
      return [response.statusCode == 200, decodedResponse['message']];
    } catch (e, s) {
      debugPrint("Error with verify otp : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }
    _isloading = !_isloading;
    notifyListeners();
    return [false, "An error occured"];
  }
}
