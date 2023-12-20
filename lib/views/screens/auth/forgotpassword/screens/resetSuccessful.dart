import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:get/get.dart';

import 'checkemail.dart';

class ResetSuccessful extends StatelessWidget {
  const ResetSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w),
          child: Column(
            children: [
              const HeightSpacer(size: 40),
              Container(
                margin: EdgeInsets.only(top: 120.h),
                child: ImageWithTextWidget(
                  assetImage: Image.asset(
                    'assets/images/tick.png',
                  ),
                  headerText: 'Password Changed',
                  subText: 'You have successfully reset your password',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const AdminOverview());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  child: const RoundedButtonWidget(
                    title: 'Back to Dashboard',
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
