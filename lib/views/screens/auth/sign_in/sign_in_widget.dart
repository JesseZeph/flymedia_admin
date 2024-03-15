import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/login_provider.dart';
import 'package:flymedia_admin/models/requests/auth/login_request.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/reuseable_text.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'button.dart';
import 'forgot_password.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 120.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ReusableText(
                    text: 'Log in your Account',
                    style: appStyle(
                        6, Color(mainTextColor.value), FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: EmailFieldLogin(email: email),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
                  child: Text('Password',
                      style: appStyle(
                          5, Color(mainTextColor.value), FontWeight.w600))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: TextInputField(
                  hintText: '*********',
                  obscureText: true,
                  controller: password,
                  onChanged: (_) {
                    // Validate the password and update the error state
                    // final passwordResult = Password.dirty(value).validator(value);
                    // passwordError.value = passwordResult;
                  },
                  // Use the passwordError to display the error text
                  // errorText: Password.showErrorPasswordMessage(passwordError.value),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Align(
                alignment: Alignment.center,
                child: LoginButton(onTap: () async {
                  // final SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  if (email.text.isEmpty || password.text.isEmpty) {
                    context.showError('One or more fields are empty');
                    return;
                  }
                  LoginModel model = LoginModel(
                    email: email.text,
                    password: password.text,
                    userType: 'SuperAdmin',
                  );
                  String newModel = loginModelToJson(model);
                  await loginNotifier.login(newModel).then((success) async {
                    if (success.first) {
                      Get.offAll(const AdminOverview());
                    } else {
                      context.showError(success.last);
                    }
                  });
                }),
              ),
              SizedBox(height: 20.h),
              const Align(
                  alignment: Alignment.center, child: ForgotPasswordWidget()),
            ],
          ),
        );
      },
    );
  }
}

class EmailFieldLogin extends StatelessWidget {
  const EmailFieldLogin({
    super.key,
    required this.email,
    // required this.emailError,
  });

  final TextEditingController email;
  // final ValueNotifier<EmailValidationError?> emailError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Text('Email address',
                style:
                    appStyle(5, Color(mainTextColor.value), FontWeight.w600))),
        TextInputField(
          hintText: 'e.g. sophielandon@gmail.com',
          controller: email,
          onChanged: (value) {
            // final emailResult = Email.dirty(value).validator(value);
            // emailError.value = emailResult;
          },
          // errorText: Email.showEmailErrorMessage(emailError.value),
        ),
      ],
    );
  }
}
