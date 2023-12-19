import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/slidefadeswitcher.dart';

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;

  const AuthSwitchButton({
    Key? key,
    required this.showSignIn,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 2.r, bottom: 60.h),
        child: SlideFadeSwitcher(
          child: showSignIn
              ? Text.rich(
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(mainTextColor.value),
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(
                                mainColor.value), // Set your desired color
                          ),
                        ),
                      ]),
                  key: const ValueKey("SignIn"),
                )
              : Text.rich(
                  TextSpan(
                    text: "Do you have an account? ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(mainTextColor.value),
                    ),
                    children: [
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color:
                              Color(mainColor.value), // Set your desired color
                        ),
                      ),
                    ],
                  ),
                  key: const ValueKey("SignUp"),
                ),
        ),
      ),
    );
  }
}
