import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:get/get.dart';

class CheckWidget extends StatefulWidget {
  const CheckWidget({Key? key, this.onPressed}) : super(key: key);
  final Function(bool?)? onPressed;

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
              if (widget.onPressed != null) {
                widget.onPressed!(isChecked);
              }
            },
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 13.r,
                      color: Color(mainColor.value),
                    )
                  : null,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "Yes, I agree to Flymedia's ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 11),
                children: [
                  TextSpan(
                    text: 'Terms of Services',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 11, color: Color(mainColor.value)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Tap gesture");
                      },
                  ),
                  TextSpan(
                    text: " and ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 11),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 11, color: Color(mainColor.value)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Tap gesture");
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
