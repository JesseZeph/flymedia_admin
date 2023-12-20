import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/forgotpassword.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ForgotPassword());
      },
      child: Text(
        'Forgot your password?',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Color(mainColor.value),
              fontSize: 4.sp,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
