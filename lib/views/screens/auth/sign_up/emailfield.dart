import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController email;
  const EmailField({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    // final emailError = useState<EmailValidationError?>(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
            child: Text('Email address',
                style:
                    appStyle(5, Color(mainTextColor.value), FontWeight.w600))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextInputField(
            controller: email,
            hintText: 'johndoe@gmail.com',
            onChanged: (value) {
              // Validate the password and update the error state
              // final emailResult = Email.dirty(value).validator(value);
              // emailError.value = emailResult;
            },
            // errorText: Email.showEmailErrorMessage(emailError.value),
          ),
        ),
      ],
    );
  }
}
