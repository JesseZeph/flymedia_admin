import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/checkemail.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:get/get.dart';

class VerificationSuccessfull extends StatelessWidget {
  const VerificationSuccessfull({Key? key}) : super(key: key);

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
                    'assets/images/tick.png',
                  ),
                  headerText: 'Account Verified',
                  subText:
                      'Your account has been successfully set up. Welcome to Flymedia!',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const AdminOverview());
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 12.w),
                  child: const RoundedButtonWidget(
                    title: 'Go to Dashboard ',
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
