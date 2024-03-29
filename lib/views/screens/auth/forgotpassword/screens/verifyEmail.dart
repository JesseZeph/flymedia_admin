import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/services/helpers/forgot_password_helper.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/resetPassword.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController pinController = TextEditingController();

  bool showResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    await Future.delayed(const Duration(minutes: 1), () {
      if (!mounted) return;
      setState(() {
        showResend = true;
      });
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 16.w,
        height: 50.h,
        textStyle: TextStyle(
          fontSize: 5.sp,
          color: Color(hintTextColor.value),
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
            color: Color(lightHintTextColor.value).withOpacity(0.3),
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
            padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 100.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  child: ImageWithTextWidget(
                      assetImage:
                          Image.asset('assets/images/unreadMessage.png'),
                      headerText: 'Verify your email address',
                      subText:
                          'Enter the 6 digits OTP sent to your email address'),
                ),
                Align(
                  child: Form(
                    key: formKey,
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      controller: pinController,
                      obscureText: true,
                      length: 6,
                      showCursor: false,
                      onCompleted: (value) {},
                      onChanged: (_) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter code.';
                        } else if (value.length < 6) {
                          return 'Code is incomplete';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: showResend,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Text(
                      "Didn't receive OTP?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 4.sp),
                    ),
                  ),
                ),
                Visibility(
                  visible: showResend,
                  child: TextButton(
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
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      await context
                          .read<ForgotPasswordHelper>()
                          .verifyOtp(pinController.text)
                          .then((resp) {
                        if (resp.first) {
                          Get.to(() => const ResetPassword());
                        } else {
                          context.showError(resp.last);
                        }
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: showResend ? 10.h : 40.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: const RoundedButtonWidget(
                        title: 'Verify',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
