import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/clientverification/useremailverification.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VerifyEmailAccount extends StatelessWidget {
  const VerifyEmailAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w),
          child: Column(
            children: [
              Container(
                width: 315.w,
                margin: EdgeInsets.only(top: 50.w),
                child: ImageWithTextWidget(
                  assetImage: Image.asset(
                    'assets/images/openlaptop.png',
                  ),
                  headerText: 'Verify your email address',
                  subText:
                      'An OTP has been sent to your email address. Please check your inbox (and spam folder, just in case) to complete the verification process.',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const EmailVerification());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
                  child: const RoundedButtonWidget(
                    title: 'Next',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
