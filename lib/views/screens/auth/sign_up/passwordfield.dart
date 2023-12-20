import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController password;
  const PasswordField({required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    // final passwordError = useState<PasswordValidationError?>(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
            child: Text('Password',
                style:
                    appStyle(5, Color(mainTextColor.value), FontWeight.w600))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextInputField(
            controller: password,
            hintText: '*******',
            obscureText: true,
            onChanged: (_) {
              // Validate the password and update the error state
              // final passwordResult = Password.dirty(value).validator(value);
              // passwordError.value = passwordResult;
            },
            // errorText: Password.showErrorPasswordMessage(passwordError.value),
          ),
        ),
      ],
    );
  }
}
