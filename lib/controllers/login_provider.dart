import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/requests/auth/login_request.dart';
import 'package:flymedia_admin/services/helpers/auth_helper.dart';
import 'package:flymedia_admin/services/helpers/firebase_auth_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class LoginNotifier extends ChangeNotifier {
  final auth = FirebaseAuthHelper();
  bool _obscureText = true;
  bool _loader = false;
  bool _entrypoint = false;
  bool? _loggedIn = false;

  bool get obscureText => _obscureText;
  bool get loader => _loader;
  String _fullName = '';
  String get fullName => _fullName;
  String _userId = '';
  String get userId => _userId;
  bool get entrypoint => _entrypoint;
  bool get loggedIn => _loggedIn ?? false;
  String get email => _email;
  String _email = '';

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  set loader(bool newState) {
    _loader = newState;
    notifyListeners();
  }

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  Future<List<dynamic>> login(String model) async {
    _loader = !_loader;
    notifyListeners();
    List<dynamic> wasSuccessful = [false];
    await AuthHelper.login(model).then(
      (response) async {
        wasSuccessful = response;
        if (wasSuccessful.first) {
          var originalModel = loginModelFromJson(model);
          await auth.signIn(
              email: originalModel.email, password: originalModel.password);
        }
      },
    );
    _loader = !_loader;
    notifyListeners();
    return wasSuccessful;
  }

  Future<void> getPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _loggedIn = prefs.getBool('loggedIn') ?? false;
    _entrypoint = prefs.getBool('entrypoint') ?? false;
    _fullName = prefs.getString('fullname') ?? '';
    _userId = prefs.getString('userId') ?? '';
    _email = prefs.getString('email') ?? '';
    notifyListeners();
    fullname = prefs.getString('fullname') ?? '';
    userUid = prefs.getString('uid') ?? '';
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    auth.signOut();
    await prefs.clear();
    await prefs.setBool('loggedIn', false);
  }
}
