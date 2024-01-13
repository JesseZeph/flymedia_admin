import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/services/helpers/forgot_password_helper.dart';
import 'package:flymedia_admin/utils/extensions/alert_loader.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/resetSuccessful.dart';

import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isloading = context.watch<ForgotPasswordHelper>().isloading;
    return LoadingOverlay(
      isLoading: isloading,
      progressIndicator: const AlertLoader(message: 'Please wait'),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                          margin: EdgeInsets.only(top: 60.h),
                          child: HeadingAndSubText(
                              heading: 'Reset Password',
                              subText: 'Enter your new password.'),
                        ),
                        Container(
                          width: 314.w,
                          padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Color(mainTextColor.value),
                                      fontSize: 4.sp),
                            ),
                          ),
                        ),
                        Container(
                          width: 314.w,
                          padding: EdgeInsets.only(bottom: 35.h),
                          child: TextInputField(
                            controller: newPasswordController,
                            hintText: '',
                            onChanged: (_) {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (newPasswordController.text.isEmpty) {
                              context.showError('Enter new password');
                              return;
                            }
                            await context
                                .read<ForgotPasswordHelper>()
                                .resetPassword(newPasswordController.text)
                                .then((resp) {
                              if (resp.first) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResetSuccessful()));
                              } else {
                                context.showError('Password reset failed');
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: const RoundedButtonWidget(
                              title: 'Confirm',
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
      ),
    );
  }
}
