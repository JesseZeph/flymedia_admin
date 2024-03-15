import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: TextField(
        cursorHeight: 20,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(filledColor.value),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.search, size: 3.sp),
          ),
          hintStyle:
              TextStyle(fontSize: 3.sp, color: Color(lightHintTextColor.value)),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
