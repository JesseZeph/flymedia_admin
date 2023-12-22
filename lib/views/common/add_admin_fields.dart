import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';

class AdminNameWidget extends StatelessWidget {
  final TextEditingController fullname;

  const AdminNameWidget({required this.fullname, super.key});

  @override
  Widget build(BuildContext context) {
    // final nameError = useState<NameValidationError?>(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
            child: Text("Admin's name",
                style:
                    appStyle(5, Color(mainTextColor.value), FontWeight.w500))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextInputField(
            controller: fullname,
            hintText: 'John Doe',
            onChanged: (value) {
              // Validate the password and update the error state
              // final nameResult = Name.dirty(value).validator(value);
              // nameError.value = nameResult;
            },
            // errorText: Name.showNameErrorMessage(nameError.value),
          ),
        ),
      ],
    );
  }
}

class AdminEmailWidget extends StatelessWidget {
  final TextEditingController email;
  const AdminEmailWidget({required this.email, super.key});

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
                    appStyle(5, Color(mainTextColor.value), FontWeight.w500))),
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

class AdminPasswordWidget extends StatelessWidget {
  final TextEditingController password;
  const AdminPasswordWidget({required this.password, super.key});

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
                    appStyle(5, Color(mainTextColor.value), FontWeight.w500))),
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
