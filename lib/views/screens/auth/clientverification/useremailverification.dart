import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/clientverification/userverificationsuccess.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController email = TextEditingController();
  final TextEditingController verificationCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 16.w,
        height: 50.h,
        margin: EdgeInsets.only(top: 10.w),
        textStyle: TextStyle(
          fontSize: 5.sp,
          color: Color(hintTextColor.value),
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
            color: Color(lightHintTextColor.value).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.r)));

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color(mainColor.value)),
      color: Color(mainColor.value).withOpacity(0.2),
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 50.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80.h),
                child: ImageWithTextWidget(
                    assetImage: Image.asset('assets/images/openlaptop.png'),
                    headerText: 'Verify your email address',
                    subText:
                        'Enter the 6 digits OTP sent to your email address'),
              ),
              Align(
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  controller: verificationCode,
                  obscureText: true,
                  length: 6,
                  showCursor: false,
                  onChanged: (_) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                child: Text(
                  "Didn't receive OTP?",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 4.sp),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend OTP",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(mainColor.value),
                      ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const VerificationSuccessfull());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
                  child: const RoundedButtonWidget(
                    title: 'Verify',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
