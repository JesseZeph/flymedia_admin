import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/signup_provider.dart';
import 'package:flymedia_admin/models/requests/auth/verification_code.dart';
import 'package:flymedia_admin/services/helpers/forgot_password_helper.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/verification/userverificationsuccess.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController email = TextEditingController();
  final TextEditingController verificationCode = TextEditingController();
  bool showResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    await Future.delayed(const Duration(minutes: 1));
    if (!mounted) return;
    setState(() {
      showResend = true;
    });
  }

  @override
  void dispose() {
    email.dispose();
    verificationCode.dispose();
    super.dispose();
  }

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
    return Consumer<SignupNotifier>(
      builder: (context, signupNotifier, child) {
        return LoadingOverlay(
          isLoading: signupNotifier.loader,
          progressIndicator: const CircularProgressIndicator.adaptive(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 120.w, vertical: 50.h),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80.h),
                      child: ImageWithTextWidget(
                          assetImage:
                              Image.asset('assets/images/openlaptop.png'),
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
                        onCompleted: (value) async {
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              String? userEmail = prefs.getString('email');
                              VerificationCode model = VerificationCode(
                                  email: userEmail,
                                  verificationCode: verificationCode.text);
                              signupNotifier.adminsEmailVerification(
                                  model, context);
                            },
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: showResend,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
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
                          onPressed: () async {
                            await SharedPreferences.getInstance()
                                .then((prefs) async {
                              String? userEmail = prefs.getString('email');
                              await context
                                  .read<ForgotPasswordHelper>()
                                  .forgotPassword(userEmail ?? '')
                                  .then((resp) {
                                if (resp.first) {
                                  context.showSuccess(
                                      'Code sent! Check your mailbox');
                                } else {
                                  context.showError(resp.last);
                                }
                              });
                            });
                          },
                          child: Text(
                            "Resend OTP",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 4.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(mainColor.value),
                                    ),
                          ),
                        )),
                    GestureDetector(
                      onTap: () async {
                        if (verificationCode.text.isEmpty ||
                            verificationCode.text.length < 6) {
                          context.showError('Enter complete code');
                          return;
                        }
                        SharedPreferences.getInstance().then((prefs) {
                          String? userEmail = prefs.getString('email');
                          VerificationCode model = VerificationCode(
                              email: userEmail,
                              verificationCode: verificationCode.text);
                          signupNotifier.adminsEmailVerification(
                              model, context);
                        });

                        Get.to(() => const VerificationSuccessfull());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 13.w),
                        child: const RoundedButtonWidget(
                          title: 'Verify',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
