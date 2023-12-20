import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/screens/auth/forgotpassword/screens/verifyEmail.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 120.w,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.w),
                child: ImageWithTextWidget(
                  assetImage: Image.asset(
                    'assets/images/unreadMessage.png',
                  ),
                  headerText: 'Check Your Email',
                  subText:
                      'A verification code has been sent to your email address',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const VerifyEmail());
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: const RoundedButtonWidget(
                    title: 'Verify Email',
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

class ImageWithTextWidget extends StatelessWidget {
  final Image assetImage;
  final String headerText;
  final String subText;

  const ImageWithTextWidget({
    super.key,
    required this.assetImage,
    required this.headerText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(width: 160.w, height: 160.h, child: assetImage),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Text(
              headerText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(mainTextColor.value),
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              subText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(mainTextColor.value).withOpacity(0.8),
                    fontSize: 4.sp,
                    fontWeight: FontWeight.w300,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class HeadingAndSubText extends StatelessWidget {
  final String heading;
  final String subText;
  HeadingAndSubText({
    super.key,
    required this.heading,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 310.w,
          margin: EdgeInsets.only(top: 20.h),
          child: Text(
            heading,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Color(mainTextColor.value),
                  fontWeight: FontWeight.w700,
                  fontSize: 6.sp,
                ),
          ),
        ),
        Container(
          width: 310.w,
          margin: EdgeInsets.only(top: 10.h),
          child: Text(
            subText,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Color(lightMainText.value),
                  fontWeight: FontWeight.w300,
                  fontSize: 4.sp,
                  height: 1.6,
                ),
          ),
        ),
      ],
    );
  }
}
