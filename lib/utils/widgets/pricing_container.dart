import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';

class SubscriptionCardWidget extends StatelessWidget {
  final Widget flyButton;
  final Widget textButton;
  final String image;
  final String tierText;
  final String priceText;
  final String featuresText;
  final Color? containerColor;
  final Color? textColor;
  const SubscriptionCardWidget({
    Key? key,
    required this.flyButton,
    required this.textButton,
    required this.image,
    required this.tierText,
    required this.priceText,
    required this.featuresText,
    this.containerColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: width * 0.28,
        height: height * 0.63,
        padding: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(
          color: containerColor ?? Color(flyGrey.value),
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5.w),
              width: width * 0.055,
              height: height * 0.080,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: Color(lightMain.value).withOpacity(0.4),
              ),
              child: ClipOval(
                child: Image.asset(
                  image,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.w),
              child: Text(
                tierText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor ??
                          Color(mainTextColor.value).withOpacity(0.8),
                      fontSize: 3.w,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$$priceText',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: textColor ?? Color(mainTextColor.value),
                        fontSize: 4.w,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    '/month',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: textColor ??
                              Color(mainTextColor.value).withOpacity(0.8),
                          fontSize: 2.w,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
            const HeightSpacer(size: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                featuresText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor ?? Color(lightMainText.value),
                      fontSize: 3.w,
                      fontWeight: FontWeight.w400,
                      height: 3.5,
                    ),
                maxLines: 5,
              ),
            ),
            const HeightSpacer(size: 25),
            flyButton,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.w),
              child: textButton,
            ),
          ],
        ),
      ),
    );
  }
}
