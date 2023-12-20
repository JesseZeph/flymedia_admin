import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';

class NameField extends StatelessWidget {
  final TextEditingController fullname;

  const NameField({required this.fullname, super.key});

  @override
  Widget build(BuildContext context) {
    // final nameError = useState<NameValidationError?>(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 5.w, bottom: 5.h),
            child: Text('Your name',
                style:
                    appStyle(5, Color(mainTextColor.value), FontWeight.w600))),
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
