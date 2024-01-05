import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/login_provider.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/auth/authpage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DialogWidget();
    },
  );
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Dialog(
      shadowColor: Color(lightHintTextColor.value),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          width: width * 0.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Color(errorColor.value),
                    size: 8.sp,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Are you sure you want to logout of the account?',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 3.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        color: Color(errorColor.value),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          loginNotifier.logout();
                          Get.offAll(() => const AuthPage());
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 3.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const WidthSpacer(width: 20),
                  Expanded(
                    child: Container(
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color(lightHintTextColor.value)),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 3.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
