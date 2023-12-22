import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';

class OverviewCardWidget extends StatelessWidget {
  final IconData? icon;
  final Color? containerColor;
  final String text;
  final String subText;

  const OverviewCardWidget({
    super.key,
    this.containerColor,
    required this.text,
    required this.subText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(18.r),
        width: width * 0.29,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(lightHintTextColor.value).withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(5.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                color: containerColor ?? Color(errorColor.value),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                icon ?? CupertinoIcons.bag_fill,
                color: Color(flyLight.value),
              ),
            ),
            const HeightSpacer(size: 10),
            Text(
              text,
              style: appStyle(4, Color(mainTextColor.value), FontWeight.w300),
            ),
            const HeightSpacer(size: 10),
            Text(
              subText,
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}

class VerificationCard extends StatelessWidget {
  final String text;
  final String countryName;
  final String website;
  final void Function() onTap;

  const VerificationCard({
    super.key,
    required this.text,
    required this.countryName,
    required this.website,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 18.h,
        ),
        width: width * 0.02,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(lightHintTextColor.value).withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(5.r)),
        child: Column(
          children: [
            Text(
              text,
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
            const HeightSpacer(size: 20),
            Text(
              website,
              style: appStyle(3, Color(mainTextColor.value), FontWeight.w400),
            ),
            const HeightSpacer(size: 14),
            Text(
              countryName,
              style: appStyle(3, Color(dialogBlue.value), FontWeight.w400),
            ),
            const HeightSpacer(size: 16),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                    color: Color(mainColor.value),
                    borderRadius: BorderRadius.circular(25.r)),
                child: Text(
                  'View Profile',
                  style: appStyle(3, Color(flyLight.value), FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}