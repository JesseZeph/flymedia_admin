import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/exports.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String title;
  const RoundedButtonWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Color(mainColor.value),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 5.sp),
      ),
    );
  }
}

class MiniRoundedButton extends StatelessWidget {
  final String title;
  const MiniRoundedButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.r),
        color: Color(mainColor.value),
      ),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: appStyle(3, Color(flyLight.value), FontWeight.w600)),
      ),
    );
  }
}

class MiniOutlineRounded extends StatelessWidget {
  final String title;
  const MiniOutlineRounded({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.r),
        border: Border.all(
          width: 1,
          color: Color(lightHintTextColor.value).withOpacity(0.5),
        ),
        color: Color(flyLight.value),
      ),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: appStyle(3, Color(mainTextColor.value), FontWeight.w600)),
      ),
    );
  }
}
