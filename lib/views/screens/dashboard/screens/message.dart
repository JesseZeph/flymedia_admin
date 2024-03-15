import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/chat_appbar.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/chat_list.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/contact_list.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/profile_bar.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/search_bar.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileBar(),
                  SearchBarWidget(),
                  ContactsList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.69,
            decoration:
                BoxDecoration(color: Color(lightMain.value).withOpacity(0.3)),
            child: Column(
              children: [
                const ChatAppBar(),
                const Expanded(child: ChatList()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                          child: TextField(
                            maxLines: null,
                            cursorHeight: 16.4,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(filledColor.value),
                              hintText: 'Type message here...',
                              hintStyle: TextStyle(
                                  color: Color(hintTextColor.value)
                                      .withOpacity(0.8),
                                  fontSize: 3.sp),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(left: 8.w),
                            ),
                          ),
                        ),
                      ),
                      const WidthSpacer(width: 20),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                            color: Color(mainColor.value),
                            borderRadius: BorderRadius.circular(22)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomKarlaText(
                              text: 'Send',
                              size: 3,
                              color: Color(flyLight.value),
                            ),
                            const WidthSpacer(width: 5),
                            const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
