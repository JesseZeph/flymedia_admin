import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';

class CustomInputField extends StatelessWidget {
  final int maxLines;
  final int maxLength;
  final String hintText;
  final Function(String) onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validate;

  CustomInputField({
    Key? key,
    this.controller,
    this.maxLines = 1,
    required this.onChanged,
    this.maxLength = 1000,
    required this.hintText,
    this.inputFormatters,
    this.validate, // Change the type to nullable
  }) : super(key: key) {
    // // Create a new list with the default formatter
    // final defaultFormatters = <TextInputFormatter>[
    //   Utf8LengthLimitingTextInputFormatter(1000)
    // ];

    // // Combine the default formatter with any additional formatters
    // inputFormat = inputFormatters != null
    //     ? [...defaultFormatters, ...inputFormatters!]
    //     : defaultFormatters;
  }

  // List<TextInputFormatter> inputFormat = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(lightHintTextColor.value).withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: appStyle(3, Color(mainTextColor.value), FontWeight.w400),
        // maxLength: maxLength,
        onChanged: onChanged,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 3.sp,
                color: Color(lightHintTextColor.value).withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),
        ),
        validator: validate,
      ),
    );
  }
}

class Utf8LengthLimitingTextInputFormatter extends TextInputFormatter {
  Utf8LengthLimitingTextInputFormatter(this.maxLength)
      : assert(maxLength == -1 || maxLength > 0);

  final int maxLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxLength > 0 && bytesLength(newValue.text) > maxLength) {
      // If already at the maximum and tried to enter even more, keep the old value.
      if (bytesLength(oldValue.text) == maxLength) {
        return oldValue;
      }
      return truncate(newValue, maxLength);
    }
    return newValue;
  }

  static TextEditingValue truncate(TextEditingValue value, int maxLength) {
    var newValue = '';
    if (bytesLength(value.text) > maxLength) {
      var length = 0;

      value.text.characters.takeWhile((char) {
        var nbBytes = bytesLength(char);
        if (length + nbBytes <= maxLength) {
          newValue += char;
          length += nbBytes;
          return true;
        }
        return false;
      });
    }
    return TextEditingValue(
      text: newValue,
      selection: value.selection.copyWith(
        baseOffset: min(value.selection.start, newValue.length),
        extentOffset: min(value.selection.end, newValue.length),
      ),
      composing: TextRange.empty,
    );
  }

  static int bytesLength(String value) {
    return utf8.encode(value).length;
  }
}
