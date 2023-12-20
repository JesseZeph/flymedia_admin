import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/checkbox.dart';
import 'package:flymedia_admin/views/common/reuseable_text.dart';
import 'package:flymedia_admin/views/screens/auth/clientverification/verifyemailaddress.dart';
import 'package:flymedia_admin/views/screens/auth/sign_up/emailfield.dart';
import 'package:flymedia_admin/views/screens/auth/sign_up/namefield.dart';
import 'package:flymedia_admin/views/screens/auth/sign_up/passwordfield.dart';
import 'package:get/get.dart';

import 'button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  bool agreedToTerms = false;

  @override
  void dispose() {
    fullname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 100.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ReusableText(
              text: 'Create an Account',
              style: appStyle(6, Color(mainTextColor.value), FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          NameField(
            fullname: fullname,
          ),
          SizedBox(
            height: 25.h,
          ),
          EmailField(
            email: email,
          ),
          SizedBox(
            height: 25.h,
          ),
          PasswordField(
            password: password,
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CheckWidget(
              onPressed: (val) => agreedToTerms = val ?? false,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SignUpButton(onTap: () {
            Get.to(() => const VerifyEmailAccount());
          }),
        ],
      ),
    );
  }
}
