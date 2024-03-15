import 'package:flutter/material.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/my_message.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/sender_message.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
