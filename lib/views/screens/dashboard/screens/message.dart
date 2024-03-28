import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/my_message.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/sender_message.dart';

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.077,
                      width: MediaQuery.of(context).size.width * 0.25,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const CustomKarlaText(
                        text: 'Conversations',
                        align: TextAlign.start,
                        size: 5,
                        weight: FontWeight.w700,
                      )),
                  Container(
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
                        hintStyle: TextStyle(
                            fontSize: 3.sp,
                            color: Color(lightHintTextColor.value)),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                                    ),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Flymedia (Campaign 1)',
                                        style: TextStyle(
                                          fontSize: 3.sp,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 6.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'message',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            WidthSpacer(width: 140),
                                            Text(
                                              '15:30 pm',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                          color:
                                              Color(lightHintTextColor.value),
                                          indent: 85),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.077,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.all(10.0),
                  color: Color(flyLight.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                            ),
                            radius: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomKarlaText(
                                text: 'Flymedia (Campaign 1)',
                                size: 3,
                                weight: FontWeight.w700,
                              ),
                              const HeightSpacer(size: 4),
                              CustomKarlaText(
                                text: 'Admin, Client, Influencer',
                                size: 2.5,
                                weight: FontWeight.w400,
                                color:
                                    Color(hintTextColor.value).withOpacity(0.6),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      SenderMessageCard(
                        title: 'Sophie',
                        message: 'ffghjd bscghsjcbknsc ccksgcssvhscs',
                      ),
                      SenderMessageCard(
                        title: 'Gabriel',
                        message: 'ffghjd bscghsjcbknsc ccksgcssvhscs',
                      ),
                      MyMessageCard(
                        message: 'My message',
                      ),
                    ],
                  ),
                ),
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
