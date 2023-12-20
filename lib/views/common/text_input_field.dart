import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/size_fade.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  const TextInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 325.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Color(lightHintTextColor.value).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8.r)),
          child: TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 4.sp,
                    color: Color(lightHintTextColor.value).withOpacity(0.5),
                    fontWeight: FontWeight.w400)),
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: inputType,
          ),
        ),
        SizeFadeSwitcher(
          child: errorText != null
              ? Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 0),
                  child: Text(
                    errorText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Color(errorColor.value)),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
