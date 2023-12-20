import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/animated_button.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const LoginButton({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AnimatedButton(
        onTap: onTap,
        child: const RoundedButtonWidget(
          title: 'Log In',
        ),
      ),
    );
  }
}
