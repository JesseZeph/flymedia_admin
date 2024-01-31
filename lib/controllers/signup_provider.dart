import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/requests/auth/verification_code.dart';
import 'package:flymedia_admin/services/helpers/auth_helper.dart';
import 'package:flymedia_admin/services/helpers/firebase_auth_helper.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/views/screens/auth/verification/userverificationsuccess.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/requests/auth/signup.dart';

class SignupNotifier extends ChangeNotifier {
  final auth = FirebaseAuthHelper();
  bool _loader = false;
  bool get loader => _loader;
  set loader(bool newState) {
    _loader = newState;
    notifyListeners();
  }

  bool? _loggedIn = false;
  bool get loggedIn => _loggedIn ?? false;
  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  final signupFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(String model) async {
    _loader = !_loader;
    notifyListeners();
    bool wasSuccessful = false;
    await AuthHelper.signUp(model).then((response) async {
      wasSuccessful = response;
      if (wasSuccessful) {
        var originalModel = signUpModelFromJson(model);
        await auth.signUp(
            email: originalModel.email, password: originalModel.password);
      }
    });

    return wasSuccessful;
  }

  Future<bool> adminSign(String model) async {
    _loader = !_loader;
    notifyListeners();
    bool wasSuccessful = false;
    await AuthHelper.adminSignUp(model).then((response) async {
      wasSuccessful = response;
      if (wasSuccessful) {
        var originalModel = signUpModelFromJson(model);
        await auth.signUp(
            email: originalModel.email, password: originalModel.password);
      }
    });
    _loader = !_loader;
    notifyListeners();
    return wasSuccessful;
  }

  adminsEmailVerification(VerificationCode model, BuildContext context) async {
    _loader = !_loader;
    notifyListeners();
    await AuthHelper.verifyEmail(model).then((response) {
      if (response == true) {
        Get.offAll(const VerificationSuccessfull());
      } else {
        context.showError('Invalid OTP');
      }
    });
    _loader = !_loader;
    notifyListeners();
  }

  getPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('loggedIn') ?? false;
  }
}
