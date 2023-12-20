import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/animated_button.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.maxWidth;

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      width: width * 0.4,
                      height: height,
                      child: Image.asset(
                        'assets/images/photo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: width * 0.4,
                        height: height,
                        child: Image.asset(
                          'assets/images/logo_frame.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 80.h),
                        child: HeadingAndSubText(
                          heading: 'Forgot Your Password?',
                          subText:
                              "Don't worry, we'll set up another one in no time. Please enter the email address associated with this account",
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Text(
                              'Email address',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 4.sp,
                                      color: Color(mainTextColor.value)),
                            ),
                          ),
                          TextInputField(
                            controller: emailCtrl,
                            hintText: 'Enter your email address',
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      AnimatedButton(
                        onTap: () {
                          Get.to(() => const CheckEmail());
                        },
                        child: const RoundedButtonWidget(
                          title: 'Send Code',
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Color(mainTextColor.value),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
