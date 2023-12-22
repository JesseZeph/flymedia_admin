import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/animated_button.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SignUpButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AnimatedButton(
        onTap: onTap,
        child: const RoundedButtonWidget(
          title: 'Sign Up',
        ),
      ),
    );
  }
}

class AddAdminButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AddAdminButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AnimatedButton(
        onTap: onTap,
        child: const RoundedButtonWidget(
          title: 'Create Admin',
        ),
      ),
    );
  }
}
